#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# Asio is a cross-platform C++ library for network and low-level I/O.
# It is header-only and is required to build Fast DDS (fastrtps), which
# is used by the default ROS 2 RMW implementation.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asio
PKG_VERSION:=1.38.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chriskohlhoff/asio.git
PKG_SOURCE_VERSION:=8806a6803cde7054c3049d3666d3ec36786568c5
PKG_MIRROR_HASH:=3b7dcd6b0a725efd8a97aad97effbb4ee470577a5fcb1d4ba26c1ea641000633

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=BSL-1.0
PKG_LICENSE_FILES:=asio/LICENSE_1_0.txt

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk

define Package/asio
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Asio C++ library (header-only)
  URL:=https://github.com/chriskohlhoff/asio
endef

define Package/asio/description
  Asio is a cross-platform C++ library for network and low-level I/O
  programming that provides developers with a consistent asynchronous
  model using a modern C++ approach.
endef

define Build/Compile
endef

define Package/asio/install
	:
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) $(PKG_BUILD_DIR)/asio/include/* $(1)/usr/include/
endef

$(eval $(call BuildPackage,asio))
