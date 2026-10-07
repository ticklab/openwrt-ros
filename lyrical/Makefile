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
		-e 's|@ROS_VENDOR_LIB_FLAGS@|$(shell ls -d $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | sed "s|^|-L|" | tr "\n" " ")|g' \
		-e 's|@ROS_VENDOR_RPATH_LINK_FLAGS@|$(shell ls -d $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | sed "s|^|-Wl,-rpath-link,|" | tr "\n" " ")|g' \
		-e 's|@ROS_VENDOR_LIB_DIRS@|$(shell ls -d $(ROS_INSTALL_DIR)/opt/*/lib 2>/dev/null | tr "\n" ";")|g' \
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
endef

$(eval $(call BuildPackage,ros2-lyrical))
