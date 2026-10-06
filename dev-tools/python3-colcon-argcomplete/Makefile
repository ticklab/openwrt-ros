include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-argcomplete
PKG_VERSION:=0.3.3
PKG_RELEASE:=1

PYPI_NAME:=colcon-argcomplete
PKG_HASH:=3e70a32b7d16b816a7c72182bdb20df985ffc01678ec9c67d44659814a61987d

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host python3-argcomplete-host/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-argcomplete
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide command line completion
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-argcomplete +python3-colcon-core
endef

define Package/python3-colcon-argcomplete/description
  Extension for colcon to provide command line completion
endef

$(eval $(call Py3Package,python3-colcon-argcomplete))
$(eval $(call BuildPackage,python3-colcon-argcomplete))
$(eval $(call BuildPackage,python3-colcon-argcomplete-src))

$(eval $(call HostBuild))
