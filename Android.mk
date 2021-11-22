ifneq ($(filter camellia,$(TARGET_DEVICE)),)

LOCAL_PATH := device/Redmi/camellia

include $(call all-makefiles-under,$(LOCAL_PATH))

endif