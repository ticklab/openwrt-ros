# ROS 2 Jazzy environment setup for OpenWrt.
#
# This script extends the current shell environment with the ROS 2 Jazzy
# installation. Source it, e.g.:
#
#   . /opt/ros/jazzy/setup.sh
#
# It is a replacement for the colcon-generated setup.sh / local_setup.sh
# which embed build-time absolute paths and are not installed on the target.

# absolute installation prefix on the OpenWrt target root filesystem
_ros2_jazzy_prefix="/opt/ros/jazzy"

# version information
export ROS_DISTRO="jazzy"
export ROS_VERSION="2"
export ROS_PYTHON_VERSION="3"

# prepend a value to a variable while avoiding duplicates
_ros2_jazzy_prepend_unique_value() {
  _listname="$1"
  _value="$2"
  eval _values=\"\$$_listname\"
  _result=""
  _found=""
  _old_IFS="$IFS"
  IFS=":"
  for _item in $_values; do
    [ -z "$_item" ] && continue
    if [ "$_item" = "$_value" ]; then
      _found=1
      continue
    fi
    _result="${_result:+$_result:}$_item"
  done
  IFS="$_old_IFS"
  if [ -n "$_found" ]; then
    eval export $_listname=\"$_result\"
  else
    eval export $_listname=\"${_value}${_result:+:$_result}\"
  fi
  unset _listname _value _values _result _found _old_IFS _item
}

# standard ROS 2 environment variables
_ros2_jazzy_prepend_unique_value AMENT_PREFIX_PATH "$_ros2_jazzy_prefix"
_ros2_jazzy_prepend_unique_value CMAKE_PREFIX_PATH "$_ros2_jazzy_prefix"
_ros2_jazzy_prepend_unique_value COLCON_PREFIX_PATH "$_ros2_jazzy_prefix"
_ros2_jazzy_prepend_unique_value LD_LIBRARY_PATH "$_ros2_jazzy_prefix/lib"
_ros2_jazzy_prepend_unique_value PATH "$_ros2_jazzy_prefix/bin"

# Python packages installed by the workspace
_ros2_jazzy_pythonpath="$_ros2_jazzy_prefix/lib/python3.11/site-packages"
if [ -d "$_ros2_jazzy_pythonpath" ]; then
  _ros2_jazzy_prepend_unique_value PYTHONPATH "$_ros2_jazzy_pythonpath"
fi

unset _ros2_jazzy_pythonpath
unset -f _ros2_jazzy_prepend_unique_value
unset _ros2_jazzy_prefix
