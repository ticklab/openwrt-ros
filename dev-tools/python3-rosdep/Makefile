include $(TOPDIR)/rules.mk

PKG_NAME:=python3-rosdep
PKG_VERSION:=0.27.0
PKG_RELEASE:=1

PYPI_NAME:=rosdep
PKG_HASH:=97cd18b9cfc78937b7c9891b22ff8174bf0116c837ddf7a90b87bc85df328ea2

PKG_MAINTAINER:=ROS Infrastructure Team
PKG_LICENSE:=BSD
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host python3-catkin-pkg/host python3-rosdistro/host python3-rospkg/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-rosdep
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=rosdep package manager abstraction tool for ROS
  URL:=https://wiki.ros.org/rosdep
  DEPENDS:=+python3-light +python3-yaml +python3-catkin-pkg +python3-rospkg +python3-rosdistro
endef

define Package/python3-rosdep/description
  rosdep package manager abstraction tool for ROS
endef

$(eval $(call Py3Package,python3-rosdep))
$(eval $(call BuildPackage,python3-rosdep))
$(eval $(call BuildPackage,python3-rosdep-src))

$(eval $(call HostBuild))
