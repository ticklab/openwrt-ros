include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-cmake
PKG_VERSION:=0.2.30
PKG_SOURCE:=colcon_cmake-$(PKG_VERSION).tar.gz
PKG_RELEASE:=1

PYPI_NAME:=colcon-cmake
PKG_HASH:=ab0ce0df58f525d1c560b66fd22eb6a62394695a2775166483829debbbb4c84e

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python-packaging/host python3-colcon-core/host python3-colcon-library-path/host python3-colcon-test-result/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-cmake
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Extension for colcon to support CMake packages
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-colcon-core +python3-colcon-library-path +python3-colcon-test-result +python3-packaging
endef

define Package/python3-colcon-cmake/description
  Extension for colcon to support CMake packages
endef

$(eval $(call Py3Package,python3-colcon-cmake))
$(eval $(call BuildPackage,python3-colcon-cmake))
$(eval $(call BuildPackage,python3-colcon-cmake-src))

$(eval $(call HostBuild))
