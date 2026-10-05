include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-mixin
PKG_VERSION:=0.3.2
PKG_SOURCE:=colcon_mixin-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-mixin
PKG_HASH:=e9304732d6cfa27cebb41ae03e3a241eca25d25caa6858275edc1ed838e49997

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-mixin
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to read CLI mixins from files
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-yaml
endef

define Package/python3-colcon-mixin/description
  Extension for colcon to read CLI mixins from files
endef

$(eval $(call Py3Package,python3-colcon-mixin))
$(eval $(call BuildPackage,python3-colcon-mixin))
$(eval $(call BuildPackage,python3-colcon-mixin-src))

$(eval $(call HostBuild))
