include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-recursive-crawl
PKG_VERSION:=0.2.3
PKG_RELEASE:=1

PYPI_NAME:=colcon-recursive-crawl
PKG_HASH:=fca5f619214d20306daaf012f91399d4d3b605364b121e5df80399432c55c603

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-recursive-crawl
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to recursively crawl for packages
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-recursive-crawl/description
  Extension for colcon to recursively crawl for packages
endef

$(eval $(call Py3Package,python3-colcon-recursive-crawl))
$(eval $(call BuildPackage,python3-colcon-recursive-crawl))
$(eval $(call BuildPackage,python3-colcon-recursive-crawl-src))

$(eval $(call HostBuild))
