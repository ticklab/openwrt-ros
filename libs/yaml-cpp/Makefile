#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# yaml-cpp is a YAML parser and emitter for C++. The ROS 2 yaml_cpp_vendor
# package requires yaml-cpp >= 0.8.0, so this provides 0.8.0 with development
# files (CMake package configuration) for the ROS 2 build.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=yaml-cpp
PKG_VERSION:=0.8.0
PKG_RELEASE:=1

PKG_SOURCE:=yaml-cpp-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/jbeder/yaml-cpp/tar.gz/refs/tags/$(PKG_VERSION)?
PKG_HASH:=fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DYAML_BUILD_SHARED_LIBS=ON \
	-DYAML_CPP_BUILD_TESTS=OFF \
	-DYAML_CPP_BUILD_TOOLS=OFF

define Package/yaml-cpp
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=YAML parser and emitter for C++
  URL:=https://github.com/jbeder/yaml-cpp
  DEPENDS:=+libstdcpp
  ABI_VERSION:=0.8
endef

define Package/yaml-cpp/description
  yaml-cpp is an open source YAML parser and emitter in C++ matching the
  YAML 1.2 spec.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/yaml-cpp/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libyaml-cpp.so.$(ABI_VERSION)* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,yaml-cpp))
