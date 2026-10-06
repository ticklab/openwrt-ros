#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# spdlog is a fast C++ logging library. It is required by rcl_logging_spdlog
# and provided here so that the ROS 2 spdlog_vendor package uses this system
# installation instead of downloading a copy.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=spdlog
PKG_VERSION:=1.12.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/gabime/spdlog.git
PKG_SOURCE_VERSION:=7e635fca68d014934b4af8a1cf874f63989352b7
PKG_MIRROR_HASH:=10fae079aaff12063929e686e53421f5d0a9099d9adaa7a18e12cb82be67c3ed

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DSPDLOG_BUILD_SHARED=ON \
	-DSPDLOG_BUILD_TESTS=OFF \
	-DSPDLOG_BUILD_EXAMPLE=OFF \
	-DSPDLOG_BUILD_BENCH=OFF \
	-DSPDLOG_FMT_EXTERNAL=OFF

define Package/spdlog
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Fast C++ logging library
  URL:=https://github.com/gabime/spdlog
  DEPENDS:=+libstdcpp
endef

define Package/spdlog/description
  spdlog is a very fast, header-only/compiled, C++ logging library.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/spdlog/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libspdlog.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,spdlog))
