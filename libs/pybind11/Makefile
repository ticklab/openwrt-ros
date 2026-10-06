#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# pybind11 is a lightweight header-only library that exposes C++ types in
# Python and vice versa. It is provided so that the ROS 2 pybind11_vendor
# package uses this system installation instead of downloading a copy.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=pybind11
PKG_VERSION:=2.11.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/pybind/pybind11.git
PKG_SOURCE_VERSION:=8a099e44b3d5f85b20f05828d919d2332a8de841
PKG_MIRROR_HASH:=570a99bc14c76575cc94616d157e962fe21f4b786f3760d5aa8ad459a82c33c3

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DPYBIND11_TEST=OFF \
	-DPYBIND11_INSTALL=ON \
	-DPYBIND11_NOPYTHON=ON \
	-DCMAKE_INSTALL_LIBDIR=lib

define Package/pybind11
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Seamless operability between C++11 and Python
  URL:=https://github.com/pybind/pybind11
endef

define Package/pybind11/description
  pybind11 is a lightweight header-only library that exposes C++ types
  in Python and vice versa, mainly to create Python bindings of existing
  C++ code.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,pybind11))
