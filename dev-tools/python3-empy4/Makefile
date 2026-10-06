#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# empy 4.2.1. ROS 2 Jazzy and Lyrical rosidl_adapter auto-detect the empy
# API and support the 4.x API (em.Configuration). Humble uses
# python3-empy3 instead.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-empy4
PKG_VERSION:=4.2.1
PKG_RELEASE:=1

PYPI_NAME:=empy
PKG_HASH:=b831d642fca95507820b53774c051803142b8441b8c42bf800011da06ba4241b

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-empy4
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A templating system for Python (4.x)
  URL:=http://www.alcyone.com/software/empy/
  DEPENDS:=+python3-light
endef

define Package/python3-empy4/description
  A templating system for Python, version 4.2.1. Used by ROS 2 Jazzy and
  Lyrical.
endef

$(eval $(call Py3Package,python3-empy4))
$(eval $(call BuildPackage,python3-empy4))
$(eval $(call BuildPackage,python3-empy4-src))

$(eval $(call HostBuild))
