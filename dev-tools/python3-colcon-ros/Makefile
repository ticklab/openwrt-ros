include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-ros
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-ros
PKG_HASH:=79a7e89f6fa636f7e4fd44a88b7860fb1da99d51f0ba7bcf0b9b624a1a578365

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-catkin-pkg/host python3-colcon-cmake/host python3-colcon-core/host python3-colcon-pkg-config/host python3-colcon-python-setup-py/host python3-colcon-recursive-crawl/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-ros
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to support ROS packages
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-catkin-pkg +python3-colcon-cmake +python3-colcon-core +python3-colcon-pkg-config +python3-colcon-python-setup-py +python3-colcon-recursive-crawl
endef

define Package/python3-colcon-ros/description
  Extension for colcon to support ROS packages
endef

$(eval $(call Py3Package,python3-colcon-ros))
$(eval $(call BuildPackage,python3-colcon-ros))
$(eval $(call BuildPackage,python3-colcon-ros-src))

$(eval $(call HostBuild))
