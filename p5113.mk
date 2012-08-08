#
# Copyright (C) 2012 The CyanogenMod Project
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

$(call inherit-product, device/samsung/p5100/p51xx-common.mk)

LOCAL_PATH := device/samsung/p5113

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/p5113/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio and prebuilt kernel
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	$(LOCAL_PATH)/configs/tiny_hw.xml:system/etc/sound/espresso10wifi \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Use the non-open-source parts, if they're present
$(call inherit-product, vendor/samsung/p51xx/p5113-vendor.mk)
