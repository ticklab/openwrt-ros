include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-parallel-executor
PKG_VERSION:=0.4.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-parallel-executor
PKG_HASH:=53094be24010a3bbc2503dc2939e38b5c9bfa0f2977c589693777a0933ec445d

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-parallel-executor
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to process packages in parallel
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-parallel-executor/description
  Extension for colcon to process packages in parallel
endef

$(eval $(call Py3Package,python3-colcon-parallel-executor))
$(eval $(call BuildPackage,python3-colcon-parallel-executor))
$(eval $(call BuildPackage,python3-colcon-parallel-executor-src))

$(eval $(call HostBuild))
