#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# TinyXML2 is a simple, small, efficient C++ XML parser. It is provided
# here because the ROS 2 tinyxml2_vendor package requires the system
# TinyXML2 library, which is not available in the default OpenWrt feeds.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinyxml2
PKG_VERSION:=10.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/leethomason/tinyxml2.git
PKG_SOURCE_VERSION:=321ea883b7190d4e85cae5512a12e5eaa8f8731f
PKG_MIRROR_HASH:=9517c563ad883e5022004f3647de719ad8b42397b1ed5c518f210cac35782edb

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=Zlib
PKG_LICENSE_FILES:=LICENSE.txt

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += -DBUILD_SHARED_LIBS=ON

define Package/tinyxml2
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=TinyXML2 XML parser
  URL:=https://github.com/leethomason/tinyxml2
  DEPENDS:=+libstdcpp
endef

define Package/tinyxml2/description
  TinyXML2 is a simple, small, efficient C++ XML parser.
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/tinyxml2.h $(1)/usr/include/
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtinyxml2.so* $(1)/usr/lib/
	$(INSTALL_DIR) $(1)/usr/lib/pkgconfig
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/pkgconfig/tinyxml2.pc $(1)/usr/lib/pkgconfig/
	$(INSTALL_DIR) $(1)/usr/lib/cmake/tinyxml2
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/cmake/tinyxml2/* $(1)/usr/lib/cmake/tinyxml2/
endef

define Package/tinyxml2/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libtinyxml2.so.* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,tinyxml2))
