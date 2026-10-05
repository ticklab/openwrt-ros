include $(TOPDIR)/rules.mk

PKG_NAME:=python3-rosdistro
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PYPI_NAME:=rosdistro
PKG_HASH:=81a0c4e51a1bfbdcab026365a0053ae55f877a398a7b56ea1411c3bf68c4f822

PKG_MAINTAINER:=ROS Infrastructure Team
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host python-yaml/host python3-catkin-pkg/host python3-rospkg/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-rosdistro
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Tools to work with the ROS distribution files
  URL:=https://wiki.ros.org/rosdistro
  DEPENDS:=+python3-light +python3-packaging +python3-yaml +python3-setuptools +python3-catkin-pkg +python3-rospkg
endef

define Package/python3-rosdistro/description
  Tools to work with the ROS distribution files
endef

$(eval $(call Py3Package,python3-rosdistro))
$(eval $(call BuildPackage,python3-rosdistro))
$(eval $(call BuildPackage,python3-rosdistro-src))

$(eval $(call HostBuild))
