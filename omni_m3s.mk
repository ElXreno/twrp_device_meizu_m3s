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

LOCAL_PATH := device/meizu/m3s

# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc

# Necessary to mount a PC
$(call inherit-product, build/target/product/full.mk)

# Release name
PRODUCT_RELEASE_NAME := m3s

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := m3s
PRODUCT_NAME := omni_m3s
PRODUCT_BRAND := Meizu
PRODUCT_MODEL := M3s
PRODUCT_MANUFACTURER := Meizu
