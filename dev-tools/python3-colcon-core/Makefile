include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-core
PKG_VERSION:=0.21.3
PKG_SOURCE:=colcon_core-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-core
PKG_HASH:=0e781b3f5d82fbd974e2ed61e40d37b711e2f94fac18971d6944cf7308ecb8d0

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host python3-distlib/host python3-empy/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-core
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Command line tool to build sets of software packages
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-distlib +python3-empy +python3-packaging +python3-setuptools
endef

define Package/python3-colcon-core/description
  Command line tool to build sets of software packages
endef

$(eval $(call Py3Package,python3-colcon-core))
$(eval $(call BuildPackage,python3-colcon-core))
$(eval $(call BuildPackage,python3-colcon-core-src))

$(eval $(call HostBuild))
