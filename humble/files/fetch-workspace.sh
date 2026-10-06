#!/bin/sh
# Fetch the ROS 2 workspace repositories described by a ros2.repos manifest.
#
# Network failures can leave an incomplete workspace, so this retries until
# no empty/partially-cloned directories remain. Directories left behind by a
# failed clone (empty, or containing only a placeholder COLCON_IGNORE marker)
# are removed before each attempt so that vcs re-clones them.
#
# Repositories that are intentionally not needed are marked with COLCON_IGNORE
# by the package build; those may be absent without affecting the build, so
# completeness is judged by the absence of left-over directories rather than
# by an exact repository count.
#
# Usage: fetch-workspace.sh <vcs> <repos-file> <src-dir>

set -u

VCS="$1"
REPOS_FILE="$2"
SRC_DIR="$3"

count_repos() {
	find "$SRC_DIR" -maxdepth 3 -name .git -type d 2>/dev/null | wc -l
}

# Remove directories that vcs created but failed to populate: directories
# without a .git entry whose contents are empty or only a COLCON_IGNORE
# placeholder. Returns the number of removed directories.
clean_incomplete() {
	removed=0
	for d in $(find "$SRC_DIR" -maxdepth 3 -mindepth 1 -type d 2>/dev/null); do
		[ -e "$d/.git" ] && continue
		contents="$(ls -A "$d" 2>/dev/null)"
		if [ -z "$contents" ] || [ "$contents" = "COLCON_IGNORE" ]; then
			rm -rf "$d"
			removed=$((removed + 1))
		fi
	done
	# also drop any remaining truly empty directories
	find "$SRC_DIR" -type d -empty -delete 2>/dev/null
	echo "$removed"
}

attempt=1
while [ "$attempt" -le 20 ]; do
	removed="$(clean_incomplete)"
	present="$(count_repos)"
	echo "vcs import attempt $attempt: $present repositories, removed $removed incomplete dirs"
	if [ "$removed" -eq 0 ] && [ "$present" -gt 0 ]; then
		echo "workspace complete: $present repositories"
		exit 0
	fi
	"$VCS" import --retry 5 --skip-existing --shallow --input "$REPOS_FILE" "$SRC_DIR" || true
	attempt=$((attempt + 1))
	sleep 5
done

removed="$(clean_incomplete)"
present="$(count_repos)"
if [ "$removed" -eq 0 ] && [ "$present" -gt 0 ]; then
	echo "workspace complete: $present repositories"
	exit 0
fi

echo "ERROR: workspace still has $removed incomplete directories (present=$present)" >&2
exit 1
