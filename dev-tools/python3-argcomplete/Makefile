#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Host-only copy of argcomplete. The packages feed already provides the
# runtime python3-argcomplete package; this host-only variant is required
# because colcon-argcomplete imports argcomplete at CLI startup and the
# host colcon environment needs the module available.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python3-argcomplete-host
PKG_VERSION:=3.2.1
PKG_RELEASE:=1

PYPI_NAME:=argcomplete
PYPI_SOURCE_NAME:=argcomplete
PKG_HASH:=437f67fb9b058da5a090df505ef9be0297c4883993f3f56cb186ff087778cfb4

PKG_MAINTAINER:=Jeffery To <jeffery.to@gmail.com>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE.rst

PKG_HOST_ONLY:=1
HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-setuptools-scm/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-argcomplete-host
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Bash tab completion for argparse (host)
  URL:=https://github.com/kislyuk/argcomplete
  DEPENDS:=+python3-light
  BUILDONLY:=1
endef

define Package/python3-argcomplete-host/description
Argcomplete provides easy, extensible command line tab completion of
arguments for your Python application.

This host-only package provides the argcomplete module for the host
Python environment used to run colcon.
endef

$(eval $(call Py3Package,python3-argcomplete-host))
$(eval $(call BuildPackage,python3-argcomplete-host))
$(eval $(call BuildPackage,python3-argcomplete-host-src))
$(eval $(call HostBuild))
