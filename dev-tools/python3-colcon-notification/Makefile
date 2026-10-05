include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-notification
PKG_VERSION:=0.3.3
PKG_SOURCE:=colcon_notification-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-notification
PKG_HASH:=a97cf4f9cf9ad60a78c3576ea633e50f7c9caae1d4aef57e55bdbb40d21151e0

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host python3-notify2/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-notification
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide status notifications
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-notify2
endef

define Package/python3-colcon-notification/description
  Extension for colcon to provide status notifications
endef

$(eval $(call Py3Package,python3-colcon-notification))
$(eval $(call BuildPackage,python3-colcon-notification))
$(eval $(call BuildPackage,python3-colcon-notification-src))

$(eval $(call HostBuild))
