$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product, device/meizu/m3s/full_m3s.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_NAME := omni_m3s
