#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only Python module of the Meson build system. The OpenWrt build
# system ships Meson as a zipapp (meson.py) but meson-python requires the
# importable mesonbuild module, so this package provides it for the host
# Python environment.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-meson-host
PKG_VERSION:=1.5.1
PKG_RELEASE:=1

PYPI_NAME:=meson
PYPI_SOURCE_NAME:=meson
PKG_HASH:=567e533adf255de73a2de35049b99923caf872a455af9ce03e01077e0d384bed

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=COPYING

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:= \
	python3/host \
	python-build/host \
	python-installer/host \
	python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-meson-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=The Meson build system (host Python module)
  URL:=https://mesonbuild.com/
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-meson-host/description
Meson is an open source build system meant to be both extremely fast,
and, even more importantly, as user friendly as possible.

This host-only package provides the importable mesonbuild module for the
host Python environment.
endef

$(eval $(call Py3Package,python3-meson-host))
$(eval $(call BuildPackage,python3-meson-host))
$(eval $(call BuildPackage,python3-meson-host-src))
$(eval $(call HostBuild))
