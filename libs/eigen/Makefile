#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Eigen is a header-only C++ template library for linear algebra. It is
# required by orocos_kdl (via orocos_kdl_vendor) and tf2_eigen.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=eigen
PKG_VERSION:=3.4.0
PKG_RELEASE:=1

PKG_SOURCE:=eigen-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://gitlab.com/libeigen/eigen/-/archive/$(PKG_VERSION)
PKG_HASH:=8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=MPL-2.0
PKG_LICENSE_FILES:=COPYING.MPL2

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

# Eigen refuses in-source builds; use a dedicated build subdirectory.
CMAKE_BINARY_SUBDIR:=build

define Package/eigen
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Eigen is a C++ template library for linear algebra
  URL:=https://eigen.tuxfamily.org/
endef

define Package/eigen/description
  Eigen is a C++ template library for linear algebra: matrices, vectors,
  numerical solvers, and related algorithms. It is header-only.
endef

define Package/eigen/install
	:
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

$(eval $(call BuildPackage,eigen))
