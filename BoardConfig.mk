#
# Copyright (C) 2016 ShevT
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_OTA_ASSERT_DEVICE := m3s,mt6750

TARGET_BOOTLOADER_BOARD_NAME := mt6750

# Arch
# For 64 bit
TARGET_ARCH := arm64
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6750
TARGET_CPU_ABI := arm64-v8a
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

# For 32 bit
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel
TARGET_PREBUILT_KERNEL := device/meizu/m3s/kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x04f88000
BOARD_TAGS_OFFSET := 0x03f88000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

# Partitions:
# Fix this up by examining /proc/partitions on a running device. (value * 1024)
#  or cat /proc/partinfo (hex to dec)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 22020096
# cat /proc/mtd. See "erasesize" column. Translate into decimal
BOARD_FLASH_BLOCK_SIZE := 4096

# File Systems
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Storages
BOARD_HAS_NO_MISC_PARTITION := true
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_FLASH_FROM_STORAGE := true
TW_SDEXT_NO_EXT4 := true
RECOVERY_SDCARD_ON_DATA := true
# Crypto
# TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p22"
# TW_CRYPTO_MNT_POINT := "/data"
# TW_CRYPTO_KEY_LOC := "footer"
# TW_INCLUDE_L_CRYPTO := true
# No partitioning SD Card
BOARD_HAS_NO_REAL_SDCARD := true

# Graphics
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 128
TW_THEME := portrait_hdpi
# Turn the screen upside down for Meizu M3s to make TWRP usable
BOARD_HAS_FLIPPED_SCREEN := true

# USB Mounting
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_MTP_DEVICE := /dev/mtp_usb

BOARD_CUSTOM_BOOTIMG_MK := device/meizu/m3s/custombootimg.mk

# Buttons:
# No Download mode
TW_HAS_DOWNLOAD_MODE := false
# No Select Button
BOARD_HAS_NO_SELECT_BUTTON := true

# The path to a temperature sensor
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone1/temp

# HW ID
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := false
TW_FORCE_CPUINFO_FOR_DEVICE_ID := false
