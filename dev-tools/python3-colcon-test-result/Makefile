include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-test-result
PKG_VERSION:=0.3.8
PKG_RELEASE:=1

PYPI_NAME:=colcon-test-result
PKG_HASH:=aa5225716a5bdd9f1df721e7a04f1e02150def8c86dd070793cb62e747c36ed3

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-test-result
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide information about test results
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-test-result/description
  Extension for colcon to provide information about test results
endef

$(eval $(call Py3Package,python3-colcon-test-result))
$(eval $(call BuildPackage,python3-colcon-test-result))
$(eval $(call BuildPackage,python3-colcon-test-result-src))

$(eval $(call HostBuild))
