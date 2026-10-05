include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-output
PKG_VERSION:=0.2.15
PKG_SOURCE:=colcon_output-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-output
PKG_HASH:=db72d0353938c4e85866d9515be08149a2dd216705528b98d092a645b2abac1a

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-output
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to customize the output in various ways
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-output/description
  Extension for colcon to customize the output in various ways
endef

$(eval $(call Py3Package,python3-colcon-output))
$(eval $(call BuildPackage,python3-colcon-output))
$(eval $(call BuildPackage,python3-colcon-output-src))

$(eval $(call HostBuild))
