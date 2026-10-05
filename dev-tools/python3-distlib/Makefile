include $(TOPDIR)/rules.mk

PKG_NAME:=python3-distlib
PKG_VERSION:=0.4.3
PKG_RELEASE:=1

PYPI_NAME:=distlib
PKG_HASH:=f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed

PKG_MAINTAINER:=Vinay Sajip <vinay_sajip@yahoo.co.uk>
PKG_LICENSE:=PSF-2.0
PKG_LICENSE_FILES:=LICENSE.txt

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-distlib
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Distribution utilities
  URL:=https://github.com/pypa/distlib
  DEPENDS:=+python3-light
endef

define Package/python3-distlib/description
  Distribution utilities
endef

$(eval $(call Py3Package,python3-distlib))
$(eval $(call BuildPackage,python3-distlib))
$(eval $(call BuildPackage,python3-distlib-src))

$(eval $(call HostBuild))
