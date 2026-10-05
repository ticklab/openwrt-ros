include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-bash
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-bash
PKG_HASH:=29a223a66828e18aad9b8db5087f7114e388601830091830ca17b095ada2cbac

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-bash
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide Bash scripts
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-bash/description
  Extension for colcon to provide Bash scripts
endef

$(eval $(call Py3Package,python3-colcon-bash))
$(eval $(call BuildPackage,python3-colcon-bash))
$(eval $(call BuildPackage,python3-colcon-bash-src))

$(eval $(call HostBuild))
