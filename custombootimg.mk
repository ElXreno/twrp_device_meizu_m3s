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

MKBOOTIMG_BIN := out/host/linux-x86/bin/mkbootimg

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo ----- Replace Font ------
	cp -f device/meizu/m3s/res/OswaldCondensed-Regular.ttf $(PRODUCT_OUT)/recovery/root/twres/fonts/RobotoCondensed-Regular.ttf
	@echo ----- Replace RU translation ------
	cp -f device/meizu/m3s/res/ru.xml $(PRODUCT_OUT)/recovery/root/twres/languages/ru.xml
	@echo ----- Replace Ukrainian translation ------
	cp -f device/meizu/m3s/res/uk.xml $(PRODUCT_OUT)/recovery/root/twres/languages/uk.xml
	@echo ----- Creating ramdisk ------
	chmod 644 $(PRODUCT_OUT)/recovery/root/init.rc
	chmod 644 $(PRODUCT_OUT)/recovery/root/default.prop
	(cd $(PRODUCT_OUT)/recovery/root/ && find * | sort | cpio -o -H newc) | gzip -9 > $(recovery_ramdisk)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG_BIN) --kernel $(PRODUCT_OUT)/kernel --ramdisk $(recovery_ramdisk) --base $(BOARD_KERNEL_BASE) --cmdline "$(BOARD_KERNEL_CMDLINE)" --pagesize $(BOARD_KERNEL_PAGESIZE) $(BOARD_MKBOOTIMG_ARGS) --output $@
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
