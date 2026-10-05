include $(TOPDIR)/rules.mk

PKG_NAME:=python3-colcon-common-extensions
PKG_VERSION:=0.3.0
PKG_RELEASE:=1

PYPI_NAME:=colcon-common-extensions
PKG_HASH:=84408d13f8a46044851a7a4e686749940539d2b3d02e6752746cbbc9a89049ff

PKG_MAINTAINER:=Dirk Thomas <web@dirk-thomas.net>
PKG_LICENSE:=Apache-2.0
PKG_LICENSE_FILES:=LICENSE

HOST_BUILD_DEPENDS:=python3/host python-build/host python-installer/host python-wheel/host python3-colcon-argcomplete/host python3-colcon-bash/host python3-colcon-cd/host python3-colcon-cmake/host python3-colcon-core/host python3-colcon-defaults/host python3-colcon-devtools/host python3-colcon-library-path/host python3-colcon-metadata/host python3-colcon-notification/host python3-colcon-output/host python3-colcon-package-information/host python3-colcon-package-selection/host python3-colcon-parallel-executor/host python3-colcon-powershell/host python3-colcon-python-setup-py/host python3-colcon-recursive-crawl/host python3-colcon-ros/host python3-colcon-test-result/host python3-colcon-zsh/host

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-host-build.mk

define Package/python3-colcon-common-extensions
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Meta package aggregating colcon-core and common extensions
  URL:=https://colcon.readthedocs.io
  DEPENDS:=+python3-light +python3-pkg-resources +python3-colcon-cmake +python3-colcon-core +python3-colcon-defaults +python3-colcon-devtools +python3-colcon-library-path +python3-colcon-metadata +python3-colcon-notification +python3-colcon-output +python3-colcon-package-information +python3-colcon-package-selection +python3-colcon-parallel-executor +python3-colcon-powershell +python3-colcon-python-setup-py +python3-colcon-recursive-crawl +python3-colcon-ros +python3-colcon-test-result +python3-colcon-argcomplete +python3-colcon-bash +python3-colcon-cd +python3-colcon-zsh
endef

define Package/python3-colcon-common-extensions/description
  Meta package aggregating colcon-core and common extensions
endef

$(eval $(call Py3Package,python3-colcon-common-extensions))
$(eval $(call BuildPackage,python3-colcon-common-extensions))
$(eval $(call BuildPackage,python3-colcon-common-extensions-src))

$(eval $(call HostBuild))
