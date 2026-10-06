#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only meson-python, the PEP 517 build backend used by numpy 2.x and
# other projects. Required to build python3-numpy/host.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-meson-python-host
PKG_VERSION:=0.18.0
PKG_RELEASE:=1

PYPI_NAME:=meson-python
PYPI_SOURCE_NAME:=meson_python
PKG_HASH:=c56a99ec9df669a40662fe46960321af6e4b14106c14db228709c1628e23848d

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:= \
	python3/host \
	python-build/host \
	python-installer/host \
	python-wheel/host \
	python-packaging/host \
	pyproject-metadata/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-meson-python-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Meson PEP 517 Python build backend (host)
  URL:=https://github.com/mesonbuild/meson-python
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-meson-python-host/description
Meson Python build backend (PEP 517).

This host-only package provides meson-python for the host Python
environment, used to build packages such as numpy.
endef

$(eval $(call Py3Package,python3-meson-python-host))
$(eval $(call BuildPackage,python3-meson-python-host))
$(eval $(call BuildPackage,python3-meson-python-host-src))
$(eval $(call HostBuild))
