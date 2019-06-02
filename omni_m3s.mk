$(call inherit-product, vendor/omni/config/gsm.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    security.perf_harden=0 \
    ro.allow.mock.location=1

PRODUCT_MANUFACTURER := Meizu

PRODUCT_DEVICE := m3s
PRODUCT_NAME := omni_m3s
PRODUCT_BRAND := Meizu
PRODUCT_MODEL := M3s
PRODUCT_BOARD := m3s
