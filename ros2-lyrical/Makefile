#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# ROS 2 Lyrical built from source following
# https://docs.ros.org/en/lyrical/Installation/Alternatives/Ubuntu-Development-Setup.html
# The ros2.repos manifest is fetched with vcs and the workspace is
# cross-compiled with colcon against the OpenWrt toolchain.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ros2-lyrical
PKG_SOURCE_DATE:=2026-10-06
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/ros2/ros2.git
PKG_SOURCE_VERSION:=291c596150d2c75cd5d4ea68c6690cbd85f27956
PKG_MIRROR_HASH:=654c64aa47192b984085f9e0fd9dc875bd226f94bd6c05a087abb7f351b4d8c1

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:= \
	python3/host \
	python3-vcstool/host \
	python3-colcon-common-extensions/host \
	python3-rosdep/host \
	python3-pyparsing-host/host \
	python3-empy4/host \
	python3-numpy-host/host \
	python3-lark-host/host \
	eigen \
	orocos-kdl \
	spdlog \
	tinyxml2 \
	liblz4 \
	libzstd \
	asio \
	pybind11 \
	lttng-ust \
	libcurl \
	libacl \
	cpptoml \
	console_bridge \
	foonathan-memory \
	libyaml \
	yaml-cpp

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

PYTHON3_VERSION:=$(shell $(STAGING_DIR_HOSTPKG)/bin/python3 -c 'import sys; print("%d.%d" % sys.version_info[:2])')
HOST_PYTHON3_NUMPY_INC:=$(shell $(STAGING_DIR_HOSTPKG)/bin/python3 -c 'import numpy; print(numpy.get_include())' 2>/dev/null)

ROS_REPOS_FILE:=$(PKG_BUILD_DIR)/ros2.repos
# Keep the fetched workspace outside PKG_BUILD_DIR so that re-running
# Build/Prepare (triggered by Makefile edits) does not wipe the already
# imported repositories.
ROS_WS:=$(BUILD_DIR)/ros2-lyrical-ws
ROS_TOOLCHAIN_FILE:=$(PKG_BUILD_DIR)/openwrt-toolchain.cmake
ROS_INSTALL_DIR:=$(PKG_INSTALL_DIR)/opt/ros/lyrical

# Directories under ros2_ws/src for which COLCON_IGNORE is created.
# These pull in heavy visualization / GUI / simulation / benchmark
# dependencies that are not needed for the core ROS 2 libraries.
ROS_IGNORE_DIRS:= \
	ros-visualization \
	ros2/rviz \
	ros-perception/image_common \
	ros2/rmw_zenoh \
	gazebo-release

# Individual packages (relative to ros2_ws/src) to skip: benchmark, lint and
# optional test/demo tooling. Non-existent paths are ignored.
ROS_IGNORE_PKGS:= \
	ament/google_benchmark_vendor \
	ament/ament_cmake/ament_cmake_google_benchmark \
	ros2/performance_test_fixture \
	ros2/rosbag2/rosbag2_performance \
	ament/ament_lint \
	ament/uncrustify_vendor \
	ros2/mimick_vendor \
	ros2/ros2_tracing/lttngpy \
	ros2/ros2_tracing/tracetools_trace \
	ros2/ros2_tracing/tracetools_launch \
	ros2/ros2_tracing/tracetools_read \
	ros2/ros2_tracing/tracetools_test \
	ros2/ros2_tracing/ros2trace \
	ros2/ros2_tracing/test_ros2trace \
	ros2/ros2_tracing/test_tracetools \
	ros2/ros2_tracing/test_tracetools_launch \
	ros2/geometry2/tf2_bullet \
	ros/kdl_parser \
	ros/robot_state_publisher \
	eclipse-iceoryx/iceoryx/tools/introspection \
	ros2/rosbag2/mcap_vendor \
	ros2/rosbag2/rosbag2_storage_mcap \
	ros2/demos/intra_process_demo \
	ros2/demos/image_tools \
	ros/ros_tutorials

# Demo (tutorial/example) packages built from ros2/demos. Their payload is
# shipped by the separate ros2-lyrical-demo package rather than by the core
# ros2-lyrical package. The exact file list of each demo package is taken
# from the colcon install manifest (CMake packages) or the setup.py
# install log (Python packages), so only the files that were actually
# built are moved (packages that were skipped are simply absent).
ROS2_LYRICAL_DEMO_PKGS:= \
	action_tutorials_cpp \
	action_tutorials_py \
	composition \
	demo_nodes_cpp \
	demo_nodes_cpp_native \
	demo_nodes_py \
	dummy_map_server \
	dummy_robot_bringup \
	dummy_sensors \
	lifecycle \
	lifecycle_py \
	logging_demo \
	pendulum_control \
	pendulum_msgs \
	quality_of_service_demo_cpp \
	quality_of_service_demo_py \
	topic_monitor \
	topic_statistics_demo

ROS2_LYRICAL_DEMO_MANIFESTS:=$(foreach p,$(ROS2_LYRICAL_DEMO_PKGS),$(ROS_WS)/build/$(p)/install_manifest.txt $(ROS_WS)/build/$(p)/install.log)

define Package/ros2-lyrical
  SECTION:=ros
  CATEGORY:=ROS
  SUBMENU:=ROS2
  TITLE:=ROS 2 Lyrical (source build)
  URL:=https://docs.ros.org/en/lyrical/
  DEPENDS:=+libstdcpp +python3-light +tinyxml2 +liblz4 +libzstd +lttng-ust +libcurl +libacl +cpptoml +python3-empy4 \
	+libatomic +libopenssl +spdlog +libsqlite3 +orocos-kdl +console_bridge +foonathan-memory +libyaml +yaml-cpp
endef

define Package/ros2-lyrical/description
  ROS 2 Lyrical built from source using vcs and colcon,
  cross-compiled against the OpenWrt toolchain.

  The default DDS middleware (Fast DDS or Cyclone DDS) can be selected
  below. Both implementations are built; the selection only sets the
  default, and it can still be overridden at runtime with the
  RMW_IMPLEMENTATION environment variable.
endef

define Package/ros2-lyrical/config
	menu "DDS middleware"
		choice
			prompt "Default DDS middleware"
			default ROS2_LYRICAL_RMW_FASTDDS

			config ROS2_LYRICAL_RMW_FASTDDS
				bool "Fast DDS (rmw_fastrtps_cpp)"

			config ROS2_LYRICAL_RMW_CYCLONEDDS
				bool "Cyclone DDS (rmw_cyclonedds_cpp)"
		endchoice
	endmenu
endef

define Package/ros2-lyrical-demo
  SECTION:=ros
  CATEGORY:=ROS
  SUBMENU:=ROS2
  TITLE:=ROS 2 Lyrical demo and tutorial nodes
  URL:=https://docs.ros.org/en/lyrical/
  DEPENDS:=ros2-lyrical
endef

define Package/ros2-lyrical-demo/description
  Demo, example and tutorial nodes from the ROS 2 lyrical ros2/demos
  repository (talker/listener, composition, lifecycle, logging,
  pendulum, quality of service and topic statistics demos).

  They are built together with the ros2-lyrical package but shipped
  separately so that the core runtime can be installed without them.
endef

ifneq ($(CONFIG_ROS2_LYRICAL_RMW_CYCLONEDDS),)
  ROS2_LYRICAL_RMW_IMPLEMENTATION:=rmw_cyclonedds_cpp
else
  ROS2_LYRICAL_RMW_IMPLEMENTATION:=rmw_fastrtps_cpp
endif

define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(ROS_WS)/src
	if [ ! -f $(ROS_WS)/.vcs-imported ]; then \
		$(STAGING_DIR_HOSTPKG)/bin/vcs import \
			--retry 5 \
			--skip-existing \
			--input $(ROS_REPOS_FILE) \
			$(ROS_WS)/src && \
		touch $(ROS_WS)/.vcs-imported; \
	fi
endef

define Build/Configure
	$(STAGING_DIR_HOST)/bin/sed \
		-e 's|@CMAKE_SYSTEM_NAME@|Linux|g' \
		-e 's|@CMAKE_SYSTEM_PROCESSOR@|$(ARCH)|g' \
		-e 's|@CMAKE_C_COMPILER@|$(CMAKE_C_COMPILER)|g' \
		-e 's|@CMAKE_CXX_COMPILER@|$(CMAKE_CXX_COMPILER)|g' \
		-e 's|@CMAKE_AR@|$(CMAKE_AR)|g' \
		-e 's|@CMAKE_NM@|$(CMAKE_NM)|g' \
		-e 's|@CMAKE_RANLIB@|$(CMAKE_RANLIB)|g' \
		-e 's|@CMAKE_FIND_ROOT_PATH@|$(CMAKE_FIND_ROOT_PATH)|g' \
		-e 's|@TARGET_CFLAGS@|$(TARGET_CFLAGS)|g' \
		-e 's|@TARGET_CXXFLAGS@|$(TARGET_CXXFLAGS)|g' \
		-e 's|@TARGET_LDFLAGS@|$(TARGET_LDFLAGS)|g' \
		-e 's|@ROS_AMENT_PREFIX@|$(ROS_INSTALL_DIR)|g' \
		-e 's|@HOST_PYTHON_PREFIX@|$(STAGING_DIR_HOSTPKG)|g' \
		-e 's|@ROS_VENDOR_LIB_FLAGS@|$(shell ls -d $(ROS_INSTALL_DIR)/lib $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | sed "s|^|-L|" | tr "\n" " ")|g' \
		-e 's|@ROS_VENDOR_RPATH_LINK_FLAGS@|$(shell ls -d $(ROS_INSTALL_DIR)/lib $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | sed "s|^|-Wl,-rpath-link,|" | tr "\n" " ")|g' \
		-e 's|@ROS_VENDOR_LIB_DIRS@|$(shell ls -d $(ROS_INSTALL_DIR)/lib $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | tr "\n" ";")|g' \
		./files/openwrt-toolchain.cmake.in > $(ROS_TOOLCHAIN_FILE)
endef

define Build/Compile
	$(foreach d,$(ROS_IGNORE_DIRS),[ -d $(ROS_WS)/src/$(d) ] && touch $(ROS_WS)/src/$(d)/COLCON_IGNORE || true;)
	$(foreach d,$(ROS_IGNORE_PKGS),[ -d $(ROS_WS)/src/$(d) ] && touch $(ROS_WS)/src/$(d)/COLCON_IGNORE || true;)
	cd $(ROS_WS) && \
	$(STAGING_DIR_HOSTPKG)/bin/colcon \
		--log-base $(ROS_WS)/log \
		build \
		--executor sequential \
		--merge-install \
		--install-base $(ROS_INSTALL_DIR) \
		--build-base $(ROS_WS)/build \
		--cmake-args \
			-DCMAKE_TOOLCHAIN_FILE=$(ROS_TOOLCHAIN_FILE) \
			-DCMAKE_INSTALL_PREFIX=$(ROS_INSTALL_DIR) \
			-DCMAKE_BUILD_TYPE=Release \
			-DBUILD_TESTING=OFF \
			-DPYTHON_EXECUTABLE=$(STAGING_DIR_HOSTPKG)/bin/python3 \
			-DPython3_EXECUTABLE=$(STAGING_DIR_HOSTPKG)/bin/python3 \
			-DPython3_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION) \
			-DPython3_LIBRARY=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION).so \
			-DPython3_NumPy_INCLUDE_DIRS=$(HOST_PYTHON3_NUMPY_INC) \
			-DPython_EXECUTABLE=$(STAGING_DIR_HOSTPKG)/bin/python3 \
			-DPython_INCLUDE_DIR=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION) \
			-DPython_LIBRARY=$(STAGING_DIR)/usr/lib/libpython$(PYTHON3_VERSION).so \
			-DTINYXML2_LIBRARY=$(STAGING_DIR)/usr/lib/libtinyxml2.so \
			-DTINYXML2_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
			-Dlz4_LIBRARY=$(STAGING_DIR)/usr/lib/liblz4.so \
			-Dlz4_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
			-Dzstd_LIBRARY=$(STAGING_DIR)/usr/lib/libzstd.so \
			-Dzstd_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
			-DAsio_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
			-Dpybind11_DIR=$(STAGING_DIR)/usr/share/cmake/pybind11 \
			-Dcpptoml_DIR=$(STAGING_DIR)/usr/lib/cmake/cpptoml \
			-DDOWNLOAD_TOML_LIB=OFF \
			-DSM_RUN_RESULT=0 \
			-DSM_RUN_RESULT__TRYRUN_OUTPUT=PTHREAD_RWLOCK_PREFER_READER_NP \
			-DCURL_LIBRARY=$(STAGING_DIR)/usr/lib/libcurl.so \
			-DCURL_INCLUDE_DIR=$(STAGING_DIR)/usr/include \
			-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake \
			-Dorocos_kdl_DIR=$(STAGING_DIR)/usr/share/orocos_kdl/cmake \
			-Dspdlog_DIR=$(STAGING_DIR)/usr/lib/cmake/spdlog \
			-Dconsole_bridge_DIR=$(STAGING_DIR)/usr/lib/console_bridge/cmake \
			-Dfoonathan_memory_DIR=$(STAGING_DIR)/usr/lib/foonathan_memory/cmake \
			-Dyaml-cpp_DIR=$(STAGING_DIR)/usr/lib/cmake/yaml-cpp \
			-DRMW_IMPLEMENTATION=$(ROS2_LYRICAL_RMW_IMPLEMENTATION)
endef

# colcon already installs the workspace into $(ROS_INSTALL_DIR); there is
# no top-level CMake build to install, so override the default from cmake.mk.
define Build/Install
	:
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/opt/ros/lyrical
	$(CP) $(ROS_INSTALL_DIR)/* $(1)/opt/ros/lyrical/
endef

define Package/ros2-lyrical/install
	$(INSTALL_DIR) $(1)/opt/ros/lyrical
	# Copy the runtime installation, excluding development-only content:
	# - include/  (C/C++ headers)
	# - src/      (source files)
	# - lib/cmake and share/*/cmake (CMake package configuration)
	# - the colcon-generated top-level shell setup scripts
	# Some directories (e.g. opt/ for vendored third-party libraries) only
	# exist when a vendor package was actually built; the system libraries
	# provided by the OpenWrt feeds leave them absent, so copy defensively.
	for d in bin etc lib share opt tools .colcon_install_layout; do \
		[ -e $(ROS_INSTALL_DIR)/$$$$d ] && $(CP) $(ROS_INSTALL_DIR)/$$$$d $(1)/opt/ros/lyrical/ || true; \
	done
	rm -rf $(1)/opt/ros/lyrical/include
	rm -rf $(1)/opt/ros/lyrical/src
	rm -rf $(1)/opt/ros/lyrical/lib/cmake
	find $(1)/opt/ros/lyrical/share -type d -name cmake -exec rm -rf {} +
	# remove the colcon-generated setup scripts; a custom setup.sh is
	# installed below instead
	rm -f $(1)/opt/ros/lyrical/setup.sh $(1)/opt/ros/lyrical/setup.bash \
		$(1)/opt/ros/lyrical/setup.zsh $(1)/opt/ros/lyrical/setup.ps1 \
		$(1)/opt/ros/lyrical/local_setup.sh $(1)/opt/ros/lyrical/local_setup.bash \
		$(1)/opt/ros/lyrical/local_setup.zsh $(1)/opt/ros/lyrical/local_setup.ps1 \
		$(1)/opt/ros/lyrical/_local_setup_util_sh.py \
		$(1)/opt/ros/lyrical/_local_setup_util_ps1.py
	$(INSTALL_BIN) ./files/setup.sh $(1)/opt/ros/lyrical/setup.sh
	# Drop the demo payload; it is shipped by ros2-lyrical-demo instead.
	# First remove the files listed in each demo package's colcon install
	# manifest (bin/, lib/, launch files, ament_index markers, ...).
	for m in $(ROS2_LYRICAL_DEMO_MANIFESTS); do \
		[ -f "$$$$m" ] || continue; \
		while IFS= read -r f; do \
			case "$$$$f" in \
				$(ROS_INSTALL_DIR)/*) \
					rel="$$$${f#$(ROS_INSTALL_DIR)/}"; \
					rm -f "$(1)/opt/ros/lyrical/$$$$rel"; \
					rmdir -p --ignore-fail-on-non-empty \
						"$(1)/opt/ros/lyrical/$$$${rel%/*}" 2>/dev/null || true; \
				;; \
			esac; \
		done < "$$$$m"; \
	done
	# Then drop the per-package content that colcon generates outside the
	# CMake install manifest (colcon-core package markers, package hooks and
	# Python __pycache__ files) so none of it leaks into the core package.
	for p in $(ROS2_LYRICAL_DEMO_PKGS); do \
		rm -f "$(1)/opt/ros/lyrical/share/colcon-core/packages/$$$$p"; \
		rm -rf "$(1)/opt/ros/lyrical/share/$$$$p"; \
		rm -rf "$(1)/opt/ros/lyrical/lib/$$$$p"; \
		rm -f "$(1)/opt/ros/lyrical"/lib/lib"$$$$p"__*.so*; \
		rm -rf "$(1)/opt/ros/lyrical"/lib/python3.*/site-packages/"$$$$p"; \
		rm -rf "$(1)/opt/ros/lyrical"/lib/python3.*/site-packages/"$$$$p"-*.egg-info; \
		rm -f "$(1)/opt/ros/lyrical"/lib/python3.*/site-packages/lib"$$$$p"__*.so; \
	done
endef

define Package/ros2-lyrical-demo/install
	$(INSTALL_DIR) $(1)/opt/ros/lyrical
	# Install the demo payload listed in the colcon install manifests,
	# skipping development-only content the same way the core package does:
	# headers, sources and CMake package configuration.
	for m in $(ROS2_LYRICAL_DEMO_MANIFESTS); do \
		[ -f "$$$$m" ] || continue; \
		while IFS= read -r f; do \
			case "$$$$f" in \
				$(ROS_INSTALL_DIR)/include/*|$(ROS_INSTALL_DIR)/src/*|$(ROS_INSTALL_DIR)/lib/cmake/*) \
					continue; \
				;; \
				$(ROS_INSTALL_DIR)/share/*/cmake/*) \
					continue; \
				;; \
				$(ROS_INSTALL_DIR)/share/colcon-core/*) \
					continue; \
				;; \
				$(ROS_INSTALL_DIR)/lib/python3.*/site-packages/*/__pycache__/*) \
					continue; \
				;; \
				$(ROS_INSTALL_DIR)/*) \
					rel="$$$${f#$(ROS_INSTALL_DIR)/}"; \
					$(INSTALL_DIR) "$(1)/opt/ros/lyrical/$$$${rel%/*}"; \
					$(CP) "$$$$f" "$(1)/opt/ros/lyrical/$$$$rel"; \
				;; \
			esac; \
		done < "$$$$m"; \
	done
	# Copy the colcon-generated per-package content that is not covered by
	# the install manifests/logs: colcon-core package markers, package hooks
	# and the Python egg-info metadata.
	for p in $(ROS2_LYRICAL_DEMO_PKGS); do \
		if [ -e "$(ROS_INSTALL_DIR)/share/$$$$p" ]; then \
			$(INSTALL_DIR) "$(1)/opt/ros/lyrical/share"; \
			$(CP) "$(ROS_INSTALL_DIR)/share/$$$$p" "$(1)/opt/ros/lyrical/share/"; \
			rm -rf "$(1)/opt/ros/lyrical/share/$$$$p/cmake"; \
		fi; \
		if [ -e "$(ROS_INSTALL_DIR)/share/colcon-core/packages/$$$$p" ]; then \
			$(INSTALL_DIR) "$(1)/opt/ros/lyrical/share/colcon-core/packages"; \
			$(INSTALL_BIN) "$(ROS_INSTALL_DIR)/share/colcon-core/packages/$$$$p" \
				"$(1)/opt/ros/lyrical/share/colcon-core/packages/$$$$p"; \
		fi; \
		for e in "$(ROS_INSTALL_DIR)"/lib/python3.*/site-packages/"$$$$p"-*.egg-info; do \
			[ -e "$$$$e" ] || continue; \
			d="$$$${e#$(ROS_INSTALL_DIR)/}"; \
			$(INSTALL_DIR) "$(1)/opt/ros/lyrical/$$$${d%/*}"; \
			$(CP) "$$$$e" "$(1)/opt/ros/lyrical/$$$$d"; \
		done; \
	done
endef

$(eval $(call BuildPackage,ros2-lyrical))
$(eval $(call BuildPackage,ros2-lyrical-demo))
