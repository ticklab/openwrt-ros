#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only copy of lark. The ROS 2 rosidl_parser uses lark to parse IDL
# files during interface generation, so it is needed in the host Python
# environment. The packages feed provides python3-lark-parser for the
# target; this host-only variant serves the build host.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-lark-host
PKG_VERSION:=1.2.2
PKG_RELEASE:=1

PYPI_NAME:=lark
PYPI_SOURCE_NAME:=lark
PKG_HASH:=ca807d0162cd16cef15a8feecb862d7319e7a09bdb13aef927968e45040fed80

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:= \
	python3/host \
	python-build/host \
	python-installer/host \
	python-wheel/host \
	python-setuptools-scm/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-lark-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A modern parsing library for Python (host)
  URL:=https://github.com/lark-parser/lark
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-lark-host/description
Lark is a parsing toolkit for Python.

This host-only package provides lark for the host Python environment used
by the ROS 2 interface generators.
endef

$(eval $(call Py3Package,python3-lark-host))
$(eval $(call BuildPackage,python3-lark-host))
$(eval $(call BuildPackage,python3-lark-host-src))
$(eval $(call HostBuild))
