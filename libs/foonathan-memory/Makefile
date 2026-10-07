#
# Copyright (C) 2026 OpenWrt ROS feeds
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# foonathan/memory is the memory allocator used by Fast DDS (via the ROS 2
# foonathan_memory_vendor package). It is provided here so that the vendor
# package detects the system installation instead of downloading a copy.
#
# The upstream eProsima fork (tag vendor-1.4.1) is used because that is the
# revision the Fast DDS vendor package pins.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=foonathan-memory
PKG_VERSION:=0.7.4
PKG_RELEASE:=1

PKG_SOURCE:=foonathan-memory-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/eProsima/memory/archive/refs/tags/vendor-1.4.1.tar.gz
PKG_HASH:=b6dc49294eb248f786c12ecc7e209dd916120bd361566a21594061f2b7753ffa

PKG_MAINTAINER:=OpenWrt ROS feeds
PKG_LICENSE:=Zlib
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_FLAGS:=no-mips16

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_OPTIONS += \
	-DFOONATHAN_MEMORY_BUILD_EXAMPLES=OFF \
	-DFOONATHAN_MEMORY_BUILD_TESTS=OFF \
	-DFOONATHAN_MEMORY_BUILD_TOOLS=OFF

define Package/foonathan-memory
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=A C++ memory allocator library for custom memory allocation
  URL:=https://github.com/foonathan/memory
  DEPENDS:=+libstdcpp
endef

define Package/foonathan-memory/description
  foonathan/memory is a library for custom memory allocation, providing
  allocators, memory arenas and a debug allocator. It is used by Fast DDS.
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/foonathan-memory/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/share/foonathan_memory
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfoonathan_memory-$(PKG_VERSION).a $(1)/usr/lib/ 2>/dev/null || true
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libfoonathan_memory*.so* $(1)/usr/lib/ 2>/dev/null || true
	$(CP) $(PKG_INSTALL_DIR)/usr/share/foonathan_memory/* $(1)/usr/share/foonathan_memory/ 2>/dev/null || true
endef

$(eval $(call BuildPackage,foonathan-memory))
