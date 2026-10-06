#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Orocos KDL (Kinematics and Dynamics Library). Required by the ROS 2
# orocos_kdl_vendor package (used by tf2_geometry_msgs and tf2_kdl).
# This builds the orocos_kdl subdirectory of orocos_kinematics_dynamics
# with tests and examples disabled.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=orocos-kdl
PKG_VERSION:=1.5.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/orocos/orocos_kinematics_dynamics.git
PKG_SOURCE_VERSION:=ce4bcb65a050615b6d7f21bc60fbb2656515791b
PKG_MIRROR_HASH:=f940e36ca64045b9a5c2d0578f7e0c1fa012306c26253cebfeb1e88add7e5766

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=orocos_kdl/COPYING

PKG_BUILD_DEPENDS:=eigen
PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_SOURCE_SUBDIR:=orocos_kdl
CMAKE_OPTIONS += \
	-DENABLE_TESTS=OFF \
	-DENABLE_EXAMPLES=OFF \
	-DEigen3_DIR=$(STAGING_DIR)/usr/share/eigen3/cmake

define Package/orocos-kdl
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Orocos Kinematics and Dynamics Library
  URL:=https://www.orocos.org/kdl
  DEPENDS:=+libstdcpp +eigen
endef

define Package/orocos-kdl/description
  The Orocos Kinematics and Dynamics Library (KDL) is a C++ library for
  modelling and computation of motion of kinematic chains.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/orocos-kdl/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liborocos-kdl.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,orocos-kdl))
