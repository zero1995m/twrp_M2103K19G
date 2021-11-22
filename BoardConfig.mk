LOCAL_PATH := device/Redmi/camellia

TARGET_BOARD_PLATFORM := sm6150               # From ro.mediatek.platform, but lowercase value
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sm6150     # From ro.product.board

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true            # To add info about F2FS Filesystem Data Block
# Put The Size of your Recovery Partition below, get it from your "MT****_Android_scatter.txt"
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
# BOARD_USES_FULL_RECOVERY_IMAGE := true      # Uncomment this line if you want to remove size restriction
BOARD_FLASH_BLOCK_SIZE := 262144              # Might be different for your chip
BOARD_HAS_NO_REAL_SDCARD := true              # Depricated
# BOARD_HAS_NO_SELECT_BUTTON := true          # Depricated
# BOARD_SUPPRESS_SECURE_ERASE := true
# BOARD_HAS_NO_MISC_PARTITION := true           # Delete if your partition table has /misc
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
RECOVERY_SDCARD_ON_DATA := true               # Optional: If /sdcard partition is emulated on /data partition 

# TWRP stuff
TW_EXCLUDE_SUPERSU := true                    # true/false: Add SuperSU or not
TW_INCLUDE_CRYPTO := true                     # true/false: Add Data Encryption Support or not
TW_INPUT_BLACKLIST := "hbtp_vm"               # Optional: Disables virtual mouse
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi                     # Set the exact theme you wanna use. If resulation doesn't match, define the height/width
DEVICE_RESOLUTION := 720x1280                 # The Resolution of your Device
TARGET_SCREEN_HEIGHT := 1280                    # The height
TARGET_SCREEN_WIDTH := 720                      # The width
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
# TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
# Set the Path of Logical Units (LUNs) for Storage below (as per your chip/device)
# TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
# TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200                   # Set custom brightness, low is better

TW_INCLUDE_NTFS_3G := true                    # Include NTFS Filesystem Support
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TWRP_INCLUDE_LOGCAT := true                   # Include LogCat Binary
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support
TW_DEFAULT_LANGUAGE := en                     # Set Default Language 
TW_EXTRA_LANGUAGES := true

# Kernel
ifeq ($(TARGET_IS_64_BIT),true)                    # true/false: Determine if the device is 64-bit or not
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/boot.img-kernel
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/prebuilt/boot.img-kernel
# Get the CMDLine, Base, Pagesize and offsets from Unpacked recovery image and put below
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 cgroup.memory=nokmem,nosocket androidboot.usbconfigfs=true androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

TARGET_BOARD_SUFFIX := _64                    # Remove if the device is 32-bit
TARGET_USES_64_BIT_BINDER := true             # Remove if the device is 32-bit

# Architecture
# According to the device's architecture (64-bit or 32-bit)
ifeq ($(TARGET_IS_64_BIT),true)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI),$(TARGET_CPU_ABI2)
endif




# DEVICE_PATH := device/xiaomi/tucana

# # Architecture
# TARGET_ARCH := arm64
# TARGET_ARCH_VARIANT := armv8-a
# TARGET_CPU_ABI := arm64-v8a
# TARGET_CPU_ABI2 :=
# TARGET_CPU_VARIANT := kryo

# TARGET_2ND_ARCH := arm
# TARGET_2ND_ARCH_VARIANT := armv8-a
# TARGET_2ND_CPU_ABI := armeabi-v7a
# TARGET_2ND_CPU_ABI2 := armeabi
# TARGET_2ND_CPU_VARIANT := cortex-a73
# TARGET_USES_64_BIT_BINDER := true

# ENABLE_CPUSETS := true
# ENABLE_SCHEDBOOST := true

# # Bootloader
# TARGET_BOOTLOADER_BOARD_NAME := sm6150
# TARGET_NO_BOOTLOADER := true
# TARGET_USES_UEFI := true

# # Platform
# TARGET_BOARD_PLATFORM := sm6150
# TARGET_BOARD_PLATFORM_GPU := qcom-adreno618

# # Kernel
# BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 cgroup.memory=nokmem,nosocket androidboot.usbconfigfs=true androidboot.selinux=permissive
# BOARD_KERNEL_BASE := 0x00000000
# BOARD_KERNEL_PAGESIZE := 4096
# BOARD_KERNEL_TAGS_OFFSET := 0x00000100
# BOARD_RAMDISK_OFFSET     := 0x01000000
# BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
# TARGET_KERNEL_ARCH := arm64
# TARGET_KERNEL_HEADER_ARCH := arm64
# TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
# BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
# BOARD_INCLUDE_RECOVERY_DTBO := true
# BOARD_BOOTIMG_HEADER_VERSION := 1
# BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
# BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
# BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# # QCOM
# #TARGET_USE_SDCLANG := true

# # Assert
# TARGET_OTA_ASSERT_DEVICE := tucana

# # Avb
# BOARD_AVB_ENABLE := true
# BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# # Partitions
# BOARD_FLASH_BLOCK_SIZE := 262144
# BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
# BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4831838208
# BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 12884901888
# BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
# BOARD_VENDORIMAGE_PARTITION_SIZE := 2147483648
# BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# # System as root
# BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
# BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
# BOARD_SUPPRESS_SECURE_ERASE := true

# # File systems
# TARGET_USERIMAGES_USE_EXT4 := true
# TARGET_USERIMAGES_USE_F2FS := true

# # Workaround for error copying vendor files to recovery ramdisk
# BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
# TARGET_COPY_OUT_VENDOR := vendor

# #Init
# TARGET_INIT_VENDOR_LIB := libinit_tucana
# TARGET_RECOVERY_DEVICE_MODULES := libinit_tucana
# TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# # Recovery
# BOARD_HAS_LARGE_FILESYSTEM := true
# TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# # Crypto
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_FBE := true

# # TWRP specific build flags
# TW_THEME := portrait_hdpi
# RECOVERY_SDCARD_ON_DATA := true
# TARGET_RECOVERY_QCOM_RTC_FIX := true
# TW_EXCLUDE_DEFAULT_USB_INIT := true
# TW_EXTRA_LANGUAGES := true
# TW_INCLUDE_NTFS_3G := true
# TW_USE_TOOLBOX := true
# TW_INPUT_BLACKLIST := "hbtp_vm"
# TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
# TW_MAX_BRIGHTNESS := 2047
# TW_DEFAULT_BRIGHTNESS := 1200
# TW_Y_OFFSET := 80
# TW_H_OFFSET := -80
# #TW_SCREEN_BLANK_ON_BOOT := true
# TWRP_INCLUDE_LOGCAT := true
# TARGET_USES_LOGD := true
# TARGET_USES_MKE2FS := true
# TW_EXCLUDE_TWRPAPP := true
# TW_SUPPORT_INPUT_1_2_HAPTICS := true

# # Hack: prevent anti rollback
# PLATFORM_SECURITY_PATCH := 2099-12-31
# PLATFORM_VERSION := 16.1.0
