include $(TOPDIR)/rules.mk

PKG_NAME:=python3-vcstool
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PYPI_NAME:=vcstool
PKG_HASH:=04b3a963e15386660f139e5b95d293e43e3cb414e3b13e14ee36f5223032ee2c

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-vcstool
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Command line tool to invoke vcs commands on multiple repositories
  URL:=https://github.com/dirk-thomas/vcstool
  DEPENDS:=+python3-light +python3-yaml +python3-setuptools
endef

define Package/python3-vcstool/description
  Command line tool to invoke vcs commands on multiple repositories
endef

$(eval $(call Py3Package,python3-vcstool))
$(eval $(call BuildPackage,python3-vcstool))
$(eval $(call BuildPackage,python3-vcstool-src))

$(eval $(call HostBuild))
