include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-cd
PKG_VERSION:=0.1.1
PKG_RELEASE:=1

PYPI_NAME:=colcon-cd
PKG_HASH:=379ef4d9f4bb3557d48ea25230ec5d749e83bb2814319e5a1d5ba5810df7b584

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host python3-colcon-package-information/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-cd
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to change the current directory
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-colcon-package-information
endef

define Package/python3-colcon-cd/description
  Extension for colcon to change the current directory
endef

$(eval $(call Py3Package,python3-colcon-cd))
$(eval $(call BuildPackage,python3-colcon-cd))
$(eval $(call BuildPackage,python3-colcon-cd-src))

$(eval $(call HostBuild))
