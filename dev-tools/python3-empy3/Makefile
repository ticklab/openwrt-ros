#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# empy 3.3.4. ROS 2 Humble's rosidl_adapter relies on the empy 3.x API
# (em.BUFFERED_OPT / em.RAW_OPT), which was removed in empy 4.x. This package
# is used by the Humble build; Jazzy/Lyrical use python3-empy4.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-empy3
PKG_VERSION:=3.3.4
PKG_RELEASE:=1

PYPI_NAME:=empy
PKG_HASH:=73ac49785b601479df4ea18a7c79bc1304a8a7c34c02b9472cf1206ae88f01b3

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=LGPL-2.1-or-later
PKG_LICENSE_FILES:=COPYING

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-empy3
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=A templating system for Python (3.x)
  URL:=http://www.alcyone.com/software/empy/
  DEPENDS:=+python3-light
endef

define Package/python3-empy3/description
  A templating system for Python, version 3.3.4. Required by ROS 2 Humble
  whose rosidl_adapter uses the empy 3.x API.
endef

$(eval $(call Py3Package,python3-empy3))
$(eval $(call BuildPackage,python3-empy3))
$(eval $(call BuildPackage,python3-empy3-src))

$(eval $(call HostBuild))
