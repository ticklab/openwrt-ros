include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-defaults
PKG_VERSION:=0.2.9
PKG_RELEASE:=1

PYPI_NAME:=colcon-defaults
PKG_HASH:=b0f3cc900626906a46ae9ee5341f78b237908df9572a10e57d0f041d946b88e3

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-yaml/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-defaults
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to read defaults from a config file
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-yaml
endef

define Package/python3-colcon-defaults/description
  Extension for colcon to read defaults from a config file
endef

$(eval $(call Py3Package,python3-colcon-defaults))
$(eval $(call BuildPackage,python3-colcon-defaults))
$(eval $(call BuildPackage,python3-colcon-defaults-src))

$(eval $(call HostBuild))
