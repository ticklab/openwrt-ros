#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only copy of numpy. The packages feed already provides the target
# python3-numpy package; this host-only variant is required because the
# ROS 2 rosidl_generator_py interface generator needs numpy (headers and
# module) in the host Python environment to build the generated Python
# extension modules.
#
# numpy 2.x uses the meson-python PEP 517 build backend. The corresponding
# host build backends (meson-python, meson, pyproject-metadata) are
# provided by the dev-tools feed as host packages.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-numpy-host
PKG_VERSION:=2.2.1
PKG_RELEASE:=1

PYPI_NAME:=numpy
PYPI_SOURCE_NAME:=numpy
PKG_HASH:=45681fd7128c8ad1c379f0ca0776a8b0c6583d2f69889ddac01559dfe4390918

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE.txt

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:= \
	python3/host \
	python-build/host \
	python-installer/host \
	python-wheel/host \
	python3-meson-python-host/host \
	python3-meson-host/host \
	pyproject-metadata/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

# The host Python is built with a shared libpython; embed an rpath so the
# compiled extension modules find libpython at import time.
PYTHON3_HOST_BUILD_VARS:=LDFLAGS="-Wl,-rpath,$(STAGING_DIR_HOSTPKG)/lib"

define Package/python3-numpy-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=The fundamental package for scientific computing with Python (host)
  URL:=https://www.numpy.org/
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-numpy-host/description
NumPy is the fundamental package for array computing with Python.

This host-only package provides numpy for the host Python environment
used by the ROS 2 Python interface generators.
endef

$(eval $(call Py3Package,python3-numpy-host))
$(eval $(call BuildPackage,python3-numpy-host))
$(eval $(call BuildPackage,python3-numpy-host-src))
$(eval $(call HostBuild))
