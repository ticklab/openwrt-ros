include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-pkg-config
PKG_VERSION:=0.1.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-pkg-config
PKG_HASH:=81fc46d037159030ba7b23970c573a31cead315f3c2410101a3cec858ec6bfa3

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-pkg-config
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to set the pkg-config environment variable
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-pkg-config/description
  Extension for colcon to set the pkg-config environment variable
endef

$(eval $(call Py3Package,python3-colcon-pkg-config))
$(eval $(call BuildPackage,python3-colcon-pkg-config))
$(eval $(call BuildPackage,python3-colcon-pkg-config-src))

$(eval $(call HostBuild))
