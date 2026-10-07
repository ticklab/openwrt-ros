#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# console_bridge is a simple C++ logging abstraction. It is required by
# rosconsole_bridge / the ROS 2 console_bridge_vendor package and provided
# here so that the vendor package uses this system installation instead of
# downloading a copy.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=console_bridge
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_SOURCE:=console_bridge-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/ros/console_bridge/archive/$(PKG_VERSION).tar.gz
PKG_HASH:=303a619c01a9e14a3c82eb9762b8a428ef5311a6d46353872ab9a904358be4a4

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DBUILD_SHARED_LIBS=ON \
	-DBUILD_TESTING=OFF

define Package/console_bridge
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A ROS-independent package for logging that seamlessly pipes into rosconsole/rosout
  URL:=https://github.com/ros/console_bridge
  DEPENDS:=+libstdcpp
endef

define Package/console_bridge/description
  console_bridge is a ROS-independent library that abstracts console output and
  is used by ROS packages such as rosconsole_bridge.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/console_bridge/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libconsole_bridge.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,console_bridge))
