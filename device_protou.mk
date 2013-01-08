$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/protou/protou-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

LOCAL_PATH := device/htc/protou
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/protou/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#idc
PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/usr/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/protou/prebuilt/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/protou/prebuilt/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/protou/prebuilt/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/protou/prebuilt/usr/idc/projector_input.idc:system/usr/idc/projector_input.idc \
    device/htc/protou/prebuilt/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/protou/prebuilt/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/protou/prebuilt/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/protou/prebuilt/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/protou/prebuilt/usr/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/protou/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/protou/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/protou/prebuilt/usr/keylayout/protou-keypad.kl:system/usr/keylayout/protou-keypad.kl \
    device/htc/protou/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/protou/prebuilt/usr/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl

PRODUCT_COPY_FILES += \
    device/htc/protou/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# HTC blobs for recovery
PRODUCT_COPY_FILES += \
    device/htc/protou/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/protou/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/protou/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/protou/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/protou/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_protou
PRODUCT_DEVICE := protou
