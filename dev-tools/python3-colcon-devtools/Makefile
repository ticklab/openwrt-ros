include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-devtools
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-devtools
PKG_HASH:=34ae3877f60ce04f50acbf11ceadb660e6eaebde837e6d8b035ab9fb8ca36e05

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-devtools
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide information about all extension points
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-packaging
endef

define Package/python3-colcon-devtools/description
  Extension for colcon to provide information about all extension points
endef

$(eval $(call Py3Package,python3-colcon-devtools))
$(eval $(call BuildPackage,python3-colcon-devtools))
$(eval $(call BuildPackage,python3-colcon-devtools-src))

$(eval $(call HostBuild))
