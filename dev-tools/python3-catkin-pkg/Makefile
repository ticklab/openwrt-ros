include $(TOPDIR)/rules.mk

PKG_NAME:=python3-catkin-pkg
PKG_VERSION:=1.1.1
PKG_RELEASE:=1

PYPI_NAME:=catkin-pkg
PYPI_SOURCE_NAME:=catkin_pkg
PKG_HASH:=475ddad4fd5c50f6b20a07af57e3376cf7ac9667ab3a0e170134cb8e2071aab9

PKG_MAINTAINER:=ROS Infrastructure Team
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-catkin-pkg
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=catkin package library
  URL:=https://wiki.ros.org/catkin
  DEPENDS:=+python3-light +python3-docutils +python3-packaging +python3-dateutil +python3-pyparsing
endef

define Package/python3-catkin-pkg/description
  catkin package library
endef

$(eval $(call Py3Package,python3-catkin-pkg))
$(eval $(call BuildPackage,python3-catkin-pkg))
$(eval $(call BuildPackage,python3-catkin-pkg-src))

$(eval $(call HostBuild))
