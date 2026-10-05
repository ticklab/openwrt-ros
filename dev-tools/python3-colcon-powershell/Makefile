include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-powershell
PKG_VERSION:=0.5.0
PKG_SOURCE:=colcon_powershell-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-powershell
PKG_HASH:=54ce6e5f6e6ebf51ff54e2857257d0ff5a16b528de9f2796a01ca212b5086d77

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-powershell
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide PowerShell scripts
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-powershell/description
  Extension for colcon to provide PowerShell scripts
endef

$(eval $(call Py3Package,python3-colcon-powershell))
$(eval $(call BuildPackage,python3-colcon-powershell))
$(eval $(call BuildPackage,python3-colcon-powershell-src))

$(eval $(call HostBuild))
