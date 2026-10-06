#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# cpptoml is a header-only TOML parsing library. It is required by the
# iceoryx iceoryx_posh package used by the ROS 2 Fast DDS / Cyclone DDS
# shared-memory transport. Providing it here avoids the network download
# performed by iceoryx's ExternalProject.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=cpptoml
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/skystrife/cpptoml.git
PKG_SOURCE_VERSION:=fededad7169e538ca47e11a9ee9251bc361a9a65
PKG_MIRROR_HASH:=881fa5808b44fe6fb6838135cca98d6c6daec592a097092cc2ea7e0a1f814fb9

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/cpptoml
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Header-only TOML parser for C++
  URL:=https://github.com/skystrife/cpptoml
  DEPENDS:=+libstdcpp
endef

define Package/cpptoml/description
  cpptoml is a header-only library for parsing TOML configuration files.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/cpptoml/install
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_INSTALL_DIR)/usr/include/cpptoml.h $(1)/usr/include/
endef

$(eval $(call BuildPackage,cpptoml))
