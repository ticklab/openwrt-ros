#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only copy of pyparsing. The packages feed already provides the
# runtime python3-pyparsing package; this host-only variant is required
# because ament_cmake / colcon build steps import pyparsing in the host
# Python environment.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-pyparsing-host
PKG_VERSION:=3.1.1
PKG_RELEASE:=1

PYPI_NAME:=pyparsing
PYPI_SOURCE_NAME:=pyparsing
PKG_HASH:=ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db

PKG_MAINTAINER:=Jan Pavlinec <jan.pavlinec1@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-flit-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-pyparsing-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Define and execute parsing grammars (host)
  URL:=https://github.com/pyparsing/pyparsing/
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-pyparsing-host/description
The pyparsing module is an alternative approach to creating and executing
simple grammars, vs. the traditional lex/yacc approach, or the use of
regular expressions.

This host-only package provides the pyparsing module for the host Python
environment used to run colcon.
endef

$(eval $(call Py3Package,python3-pyparsing-host))
$(eval $(call BuildPackage,python3-pyparsing-host))
$(eval $(call BuildPackage,python3-pyparsing-host-src))
$(eval $(call HostBuild))
