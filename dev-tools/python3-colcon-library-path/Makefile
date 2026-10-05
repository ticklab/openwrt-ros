include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-library-path
PKG_VERSION:=0.2.1
PKG_RELEASE:=1

PYPI_NAME:=colcon-library-path
PKG_HASH:=8288fc911aab5682771b45fff6437adefefbd30adf38acd2adffeccf4a24e9e2

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-library-path
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to set the library path environment variable
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-library-path/description
  Extension for colcon to set the library path environment variable
endef

$(eval $(call Py3Package,python3-colcon-library-path))
$(eval $(call BuildPackage,python3-colcon-library-path))
$(eval $(call BuildPackage,python3-colcon-library-path-src))

$(eval $(call HostBuild))
