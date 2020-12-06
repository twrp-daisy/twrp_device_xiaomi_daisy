#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

$(call inherit-product, build/target/product/embedded.mk)

# Platform
TARGET_BOARD_PLATFORM := msm8953

# A/B Updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    bootctrl.$(TARGET_BOARD_PLATFORM) \

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    libcutils \
    libgptutils \
    libz

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=$(TARGET_BOARD_PLATFORM) \
    ro.hardware.keymaster=$(TARGET_BOARD_PLATFORM) \
    ro.hardware.gatekeeper=$(TARGET_BOARD_PLATFORM) \
    ro.hardware.bootctrl=$(TARGET_BOARD_PLATFORM) \
    ro.build.system_root_image=true

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := daisy
PRODUCT_NAME := omni_daisy
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi A2 Lite
PRODUCT_MANUFACTURER := Xiaomi
