ifneq ($(TARGET_SIMULATOR),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	dbutil.c buffer.c \
	dss.c bignum.c \
	signkey.c rsa.c dbrandom.c \
	queue.c \
	atomicio.c compat.c  fake-rfc2553.c
LOCAL_SRC_FILES+=\
	common-session.c packet.c common-algo.c common-kex.c \
	common-channel.c common-chansession.c termcodes.c \
	tcp-accept.c listener.c process-packet.c \
	common-runopts.c circbuffer.c
# loginrec.c 
LOCAL_SRC_FILES+=\
	cli-main.c cli-auth.c cli-authpasswd.c cli-kex.c \
	cli-session.c cli-runopts.c cli-chansession.c \
	cli-authpubkey.c cli-tcpfwd.c cli-channel.c cli-authinteract.c
LOCAL_SRC_FILES+=netbsd_getpass.c crypto_desc.c cli-agentfwd.c list.c

LOCAL_STATIC_LIBRARIES := libtommath libtomcrypt

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := ssh
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtommath 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtomcrypt/src/headers
LOCAL_CFLAGS += -DDROPBEAR_CLIENT

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	scp.c progressmeter.c atomicio.c scpmisc.c

LOCAL_STATIC_LIBRARIES := libtommath libtomcrypt

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

LOCAL_MODULE_TAGS := debug

LOCAL_MODULE := scp
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtommath 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtomcrypt/src/headers
LOCAL_CFLAGS += -DDROPBEAR_CLIENT -DPROGRESS_METER

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	dbutil.c buffer.c \
	dss.c bignum.c \
	signkey.c rsa.c dbrandom.c \
	queue.c \
	atomicio.c compat.c fake-rfc2553.c

LOCAL_SRC_FILES+=\
	common-session.c packet.c common-algo.c common-kex.c \
	common-channel.c common-chansession.c termcodes.c \
	tcp-accept.c listener.c process-packet.c \
	common-runopts.c circbuffer.c \
	loginrec.c

LOCAL_SRC_FILES+=\
	svr-kex.c svr-auth.c sshpty.c \
	svr-authpasswd.c svr-authpubkey.c svr-authpubkeyoptions.c svr-session.c svr-service.c \
	svr-chansession.c svr-runopts.c svr-agentfwd.c svr-main.c svr-x11fwd.c \
	svr-tcpfwd.c svr-authpam.c gensignkey.c gendss.c genrsa.c
LOCAL_SRC_FILES+=crypto_desc.c freebsd_crypt.c
LOCAL_SRC_FILES+=openpty.c


LOCAL_STATIC_LIBRARIES := libtommath libtomcrypt
LOCAL_SHARED_LIBRARIES := \
	libutils \
	libcutils \
	libc

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := dropbear
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtommath 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtomcrypt/src/headers
LOCAL_CFLAGS += -DDROPBEAR_SERVER -DANDROID_CHANGES  -DSFTPSERVER_PATH='"/data/dropbear/sftp-server"'

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	dbutil.c buffer.c \
	dss.c bignum.c \
	signkey.c rsa.c dbrandom.c \
	queue.c \
	atomicio.c compat.c fake-rfc2553.c

LOCAL_SRC_FILES+=\
	dropbearkey.c gendss.c genrsa.c gensignkey.c
LOCAL_SRC_FILES+=crypto_desc.c
LOCAL_STATIC_LIBRARIES := libtommath libtomcrypt

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := dropbearkey
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtommath 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtomcrypt/src/headers
LOCAL_CFLAGS += -DDROPBEAR_SERVER

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	dbutil.c buffer.c \
	dss.c bignum.c \
	signkey.c rsa.c dbrandom.c \
	queue.c \
	atomicio.c compat.c fake-rfc2553.c keyimport.c

LOCAL_SRC_FILES+=\
	 dropbearconvert.c gendss.c genrsa.c gensignkey.c
LOCAL_SRC_FILES+=crypto_desc.c	
LOCAL_STATIC_LIBRARIES := libtommath libtomcrypt

LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := dropbearconvert
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtommath 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/libtomcrypt/src/headers
LOCAL_CFLAGS += -DDROPBEAR_SERVER

include $(BUILD_EXECUTABLE) 

endif  # TARGET_SIMULATOR != true

include $(call all-makefiles-under,$(LOCAL_PATH))
