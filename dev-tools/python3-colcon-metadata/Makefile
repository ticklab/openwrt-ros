include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-metadata
PKG_VERSION:=0.3.1
PKG_SOURCE:=colcon_metadata-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-metadata
PKG_HASH:=67cc773182c0958f09835b9d30f4851860ede89766d57d01f17821b4596fd555

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-metadata
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to read package metadata
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-yaml
endef

define Package/python3-colcon-metadata/description
  Extension for colcon to read package metadata
endef

$(eval $(call Py3Package,python3-colcon-metadata))
$(eval $(call BuildPackage,python3-colcon-metadata))
$(eval $(call BuildPackage,python3-colcon-metadata-src))

$(eval $(call HostBuild))
