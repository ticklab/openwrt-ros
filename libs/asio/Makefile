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
# Asio 1.22.1 is used because ROS 2 Humble's Fast DDS 2.6.x relies on the
# deprecated asio::io_service API, which was removed in newer Asio
# releases. 1.22.1 still provides both asio::io_service and
# asio::io_context, so it is also compatible with Jazzy/Lyrical
# (Fast DDS 2.14).
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asio
PKG_VERSION:=1.22.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/chriskohlhoff/asio.git
PKG_SOURCE_VERSION:=bba12d10501418fd3789ce01c9f86a77d37df7ed
PKG_MIRROR_HASH:=f83140adf4652b501530025a2bdc432632f59b63bed5e5a103102fe14dcf0b98

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
