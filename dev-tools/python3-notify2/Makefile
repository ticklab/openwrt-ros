include $(TOPDIR)/rules.mk

PKG_NAME:=python3-notify2
PKG_VERSION:=0.3.1
PKG_RELEASE:=1

PYPI_NAME:=notify2
PKG_HASH:=33fa108d50c42f3cd3407cc437518ad3f6225d1bb237011f16393c9dd3ce197d

PKG_MAINTAINER:=Thomas Kluyver <takowl@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-notify2
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python interface to DBus notifications
  URL:=https://github.com/takluyver/notify2
  DEPENDS:=+python3-light
endef

define Package/python3-notify2/description
  Python interface to DBus notifications
endef

$(eval $(call Py3Package,python3-notify2))
$(eval $(call BuildPackage,python3-notify2))
$(eval $(call BuildPackage,python3-notify2-src))

$(eval $(call HostBuild))
