LOCAL_PATH := $(call my-dir)

ifneq ($(filter m3s, $(TARGET_DEVICE)),)

include $(CLEAR_VARS)
LOCAL_MODULE		:= init.recovery.mt6755.rc
LOCAL_MODULE_TAGS	:= optional eng
LOCAL_MODULE_CLASS	:= ETC
LOCAL_SRC_FILES		:= etc/init.recovery.mt6755.rc
LOCAL_MODULE_PATH	:= $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

endif