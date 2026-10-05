include $(TOPDIR)/rules.mk

PKG_NAME:=python3-rospkg
PKG_VERSION:=1.6.3
PKG_RELEASE:=1

PYPI_NAME:=rospkg
PKG_HASH:=023bf5a19ce33ed50e3711af92769233e62b1b1b4671d2bb7bfc5e654533f797

PKG_MAINTAINER:=ROS Infrastructure Team
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host python3-catkin-pkg/host python3-distro/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-rospkg
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=ROS package library
  URL:=https://wiki.ros.org/rospkg
  DEPENDS:=+python3-light +python3-catkin-pkg +python3-yaml +python3-distro
endef

define Package/python3-rospkg/description
  ROS package library
endef

$(eval $(call Py3Package,python3-rospkg))
$(eval $(call BuildPackage,python3-rospkg))
$(eval $(call BuildPackage,python3-rospkg-src))

$(eval $(call HostBuild))
