include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-package-information
PKG_VERSION:=0.4.1
PKG_SOURCE:=colcon_package_information-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-package-information
PKG_HASH:=4e0143cc0288280b5fd75ada7c75f697857d694ff48a68da6fcc178b6ffb2726

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-package-information
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide information about packages
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-packaging
endef

define Package/python3-colcon-package-information/description
  Extension for colcon to provide information about packages
endef

$(eval $(call Py3Package,python3-colcon-package-information))
$(eval $(call BuildPackage,python3-colcon-package-information))
$(eval $(call BuildPackage,python3-colcon-package-information-src))

$(eval $(call HostBuild))
