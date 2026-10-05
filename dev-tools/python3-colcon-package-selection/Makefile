include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-package-selection
PKG_VERSION:=0.2.10
PKG_RELEASE:=1

PYPI_NAME:=colcon-package-selection
PKG_HASH:=494493d836c7ac69ce6d5e9f69a6efca6619da8e691e5a4138c975e6f31103db

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-package-selection
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to select packages to process
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-package-selection/description
  Extension for colcon to select packages to process
endef

$(eval $(call Py3Package,python3-colcon-package-selection))
$(eval $(call BuildPackage,python3-colcon-package-selection))
$(eval $(call BuildPackage,python3-colcon-package-selection-src))

$(eval $(call HostBuild))
