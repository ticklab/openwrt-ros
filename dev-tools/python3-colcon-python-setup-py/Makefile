include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-python-setup-py
PKG_VERSION:=0.2.9
PKG_RELEASE:=1

PYPI_NAME:=colcon-python-setup-py
PKG_HASH:=4d8bab2e05ba334e29eee3715fbde490281342ed8e000e252130e5c51915383a

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-python-setup-py
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to support Python packages with a setup.py file
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-setuptools
endef

define Package/python3-colcon-python-setup-py/description
  Extension for colcon to support Python packages with a setup.py file
endef

$(eval $(call Py3Package,python3-colcon-python-setup-py))
$(eval $(call BuildPackage,python3-colcon-python-setup-py))
$(eval $(call BuildPackage,python3-colcon-python-setup-py-src))

$(eval $(call HostBuild))
