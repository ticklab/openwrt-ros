include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-zsh
PKG_VERSION:=0.5.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-zsh
PKG_HASH:=efff75c43ddab2649853529e41cee36e0f83b6d4c864c0736353d0dece78334a

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-core/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-zsh
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to provide Z shell scripts
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core
endef

define Package/python3-colcon-zsh/description
  Extension for colcon to provide Z shell scripts
endef

$(eval $(call Py3Package,python3-colcon-zsh))
$(eval $(call BuildPackage,python3-colcon-zsh))
$(eval $(call BuildPackage,python3-colcon-zsh-src))

$(eval $(call HostBuild))
