APP=volzhanin_esp32
APP_BIN_LIBS=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/objs/libmongoose-esp32-2.19.1.a /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/objs/libota-common-esp32-2.19.1.a /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/objs/libota-http-client-esp32-2.19.1.a /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/objs/libota-http-server-esp32-2.19.1.a
APP_CFLAGS=-DARDUINO=150 -DESP32=1 -DF_CPU=160000000 -DLFS_NO_DEBUG=1 -DMBEDTLS_FREE_CERT_CHAIN=1 -DMBEDTLS_USER_CONFIG_FILE=\"mbedtls_platform_config.h\" -DMBEDTLS_X509_CA_CHAIN_ON_DISK=1 -DMGOS=1 -DMGOS_ENABLE_FILE_UPLOAD=1 -DMGOS_ENABLE_RPC_CHANNEL_HTTP=1 -DMGOS_ENABLE_SYS_SERVICE=1 -DMGOS_ENABLE_WEB_CONFIG=0 -DMGOS_ESP8266_WIFI_ENABLE_WPAENT=0 -DMGOS_HAVE_ARDUINO_COMPAT=1 -DMGOS_HAVE_ARDUINO_ONEWIRE=1 -DMGOS_HAVE_BT_COMMON=1 -DMGOS_HAVE_CORE=1 -DMGOS_HAVE_FREERTOS=1 -DMGOS_HAVE_HTTP_SERVER=1 -DMGOS_HAVE_I2C=1 -DMGOS_HAVE_MBEDTLS=1 -DMGOS_HAVE_MJS=1 -DMGOS_HAVE_MONGOOSE=1 -DMGOS_HAVE_ONEWIRE=1 -DMGOS_HAVE_OTA_COMMON=1 -DMGOS_HAVE_OTA_HTTP_CLIENT=1 -DMGOS_HAVE_OTA_HTTP_SERVER=1 -DMGOS_HAVE_PWM=1 -DMGOS_HAVE_RPC_COMMON=1 -DMGOS_HAVE_RPC_LOOPBACK=1 -DMGOS_HAVE_RPC_SERVICE_CONFIG=1 -DMGOS_HAVE_RPC_SERVICE_FS=1 -DMGOS_HAVE_RPC_UART=1 -DMGOS_HAVE_VFS_COMMON=1 -DMGOS_HAVE_VFS_FS_LFS=1 -DMGOS_HAVE_VFS_FS_SPIFFS=1 -DMGOS_HAVE_WIFI=1 -DMGOS_HAVE_ZZ_BOARDS=1 -DMGOS_LFS1_COMPAT=0 -DMGOS_ROOT_FS_OPTS_LFS={"bs":4096,"is":128} -DMGOS_ROOT_FS_OPTS_SPIFFS={"bs":4096,"ps":256,"es":4096} -DMGOS_WIFI_ENABLE_AP_STA=1 -DMG_DISABLE_HTTP_KEEP_ALIVE=1 -DMG_ENABLE_DNS=1 -DMG_ENABLE_DNS_SERVER=1 -DMG_ENABLE_HTTP_SSI=0 -DMG_ENABLE_HTTP_STREAMING_MULTIPART=1 -DMG_ENABLE_MQTT=1 -DMG_ENABLE_SNTP=1 -DMG_ENABLE_SSL=1 -DMG_ENABLE_TUN=0 -DMG_LOG_DNS_FAILURES=1 -DMG_MAX_DNS_ANSWERS=16 -DMG_MAX_DNS_QUESTIONS=16 -DMG_MAX_HTTP_REQUEST_SIZE=3072 -DMG_MAX_HTTP_SEND_MBUF=256 -DMG_MAX_PATH=256 -DMG_SSL_IF=MG_SSL_IF_MBEDTLS -DMG_SSL_IF_MBEDTLS_FREE_CERTS=1
APP_CONF_SCHEMA=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/gen/mos_conf_schema.yml
APP_CXXFLAGS=-DARDUINO=150 -DESP32=1 -DF_CPU=160000000 -DLFS_NO_DEBUG=1 -DMBEDTLS_FREE_CERT_CHAIN=1 -DMBEDTLS_USER_CONFIG_FILE=\"mbedtls_platform_config.h\" -DMBEDTLS_X509_CA_CHAIN_ON_DISK=1 -DMGOS=1 -DMGOS_ENABLE_FILE_UPLOAD=1 -DMGOS_ENABLE_RPC_CHANNEL_HTTP=1 -DMGOS_ENABLE_SYS_SERVICE=1 -DMGOS_ENABLE_WEB_CONFIG=0 -DMGOS_ESP8266_WIFI_ENABLE_WPAENT=0 -DMGOS_HAVE_ARDUINO_COMPAT=1 -DMGOS_HAVE_ARDUINO_ONEWIRE=1 -DMGOS_HAVE_BT_COMMON=1 -DMGOS_HAVE_CORE=1 -DMGOS_HAVE_FREERTOS=1 -DMGOS_HAVE_HTTP_SERVER=1 -DMGOS_HAVE_I2C=1 -DMGOS_HAVE_MBEDTLS=1 -DMGOS_HAVE_MJS=1 -DMGOS_HAVE_MONGOOSE=1 -DMGOS_HAVE_ONEWIRE=1 -DMGOS_HAVE_OTA_COMMON=1 -DMGOS_HAVE_OTA_HTTP_CLIENT=1 -DMGOS_HAVE_OTA_HTTP_SERVER=1 -DMGOS_HAVE_PWM=1 -DMGOS_HAVE_RPC_COMMON=1 -DMGOS_HAVE_RPC_LOOPBACK=1 -DMGOS_HAVE_RPC_SERVICE_CONFIG=1 -DMGOS_HAVE_RPC_SERVICE_FS=1 -DMGOS_HAVE_RPC_UART=1 -DMGOS_HAVE_VFS_COMMON=1 -DMGOS_HAVE_VFS_FS_LFS=1 -DMGOS_HAVE_VFS_FS_SPIFFS=1 -DMGOS_HAVE_WIFI=1 -DMGOS_HAVE_ZZ_BOARDS=1 -DMGOS_LFS1_COMPAT=0 -DMGOS_ROOT_FS_OPTS_LFS={"bs":4096,"is":128} -DMGOS_ROOT_FS_OPTS_SPIFFS={"bs":4096,"ps":256,"es":4096} -DMGOS_WIFI_ENABLE_AP_STA=1 -DMG_DISABLE_HTTP_KEEP_ALIVE=1 -DMG_ENABLE_DNS=1 -DMG_ENABLE_DNS_SERVER=1 -DMG_ENABLE_HTTP_SSI=0 -DMG_ENABLE_HTTP_STREAMING_MULTIPART=1 -DMG_ENABLE_MQTT=1 -DMG_ENABLE_SNTP=1 -DMG_ENABLE_SSL=1 -DMG_ENABLE_TUN=0 -DMG_LOG_DNS_FAILURES=1 -DMG_MAX_DNS_ANSWERS=16 -DMG_MAX_DNS_QUESTIONS=16 -DMG_MAX_HTTP_REQUEST_SIZE=3072 -DMG_MAX_HTTP_SEND_MBUF=256 -DMG_MAX_PATH=256 -DMG_SSL_IF=MG_SSL_IF_MBEDTLS -DMG_SSL_IF_MBEDTLS_FREE_CERTS=1
APP_FS_FILES=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_bitbang.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_config.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_events.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_gpio.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_http.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_log.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_net.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_sys.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_timer.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/api_uart.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/fs/polyfill.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mjs/mjs/lib/api_dataview.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mjs/mjs/lib/api_file.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mjs/mjs/lib/api_math.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-onewire/mjs_fs/api_arduino_onewire.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/mjs_fs/api_bt_gap.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/mjs_fs/api_bt_gatt.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/mjs_fs/api_bt_gattc.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/mjs_fs/api_bt_gatts.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/i2c/mjs_fs/api_i2c.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/ota-http-client/mjs_fs/api_ota.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/pwm/mjs_fs/api_pwm.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/mjs_fs/api_rpc.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/mjs_fs/api_wifi.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/esp32/fs/api_arch_uart.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/esp32/fs/api_esp32.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/fs/ds18b20.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/fs/init.js /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/fs/sensors.js
APP_INCLUDES=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/freertos/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/freertos/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mbedtls/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mbedtls/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mongoose/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs1 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/include/spiffs /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/core/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/core/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-compat/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-compat/include/sys /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/onewire/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-onewire/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/i2c/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/http-server/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/ota-common/src /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/ota-common/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/ota-common/include/esp32 /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/ota-http-client/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/pwm/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-loopback/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-service-config/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-uart/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/include /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/include/esp32
APP_SOURCES=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/src/main.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/gen/mgos_deps_init.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/freertos/src/mgos_freertos.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/freertos/src/mgos_freertos_core_dump.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mbedtls/src/mgos_mbedtls.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mbedtls/src/esp32/esp32_aes.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mbedtls/src/esp32/esp32_bignum.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/aes.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/aes_atca.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/aesni.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/arc4.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/aria.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/asn1parse.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/asn1write.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/base64.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/bignum.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/blowfish.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/camellia.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ccm.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/certs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/chacha20.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/chachapoly.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/cipher.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/cipher_wrap.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/cmac.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ctr_drbg.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/debug.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/des.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/dhm.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecdh.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecdsa.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecjpake.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecp.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecp_atca.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ecp_curves.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/entropy.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/entropy_poll.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/error.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/gcm.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/havege.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/hkdf.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/hmac_drbg.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/md.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/md2.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/md4.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/md5.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/md_wrap.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/memory_buffer_alloc.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/net_sockets.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/nist_kw.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/oid.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/padlock.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pem.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pk.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pk_wrap.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pkcs11.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pkcs12.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pkcs5.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pkparse.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/pkwrite.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/platform.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/platform_util.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/poly1305.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ripemd160.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/rsa.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/rsa_internal.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/sha1.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/sha256.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/sha512.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_cache.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_ciphersuites.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_cli.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_cookie.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_srv.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_ticket.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/ssl_tls.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/threading.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/timing.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/version.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/version_features.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509_create.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509_crl.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509_crt.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509_csr.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509write_crt.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/x509write_csr.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mbedtls/library/xtea.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/mgos_vfs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/mgos_vfs_dev.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/mgos_vfs_internal.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/esp32/esp32_fs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/esp32/esp32_fs_crypt.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-common/src/esp32/esp32_vfs_dev_partition.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/src/mgos_vfs_lfs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs/lfs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs/lfs_util.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs1/lfs1.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-lfs/littlefs1/lfs1_util.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/mgos_vfs_fs_spiffs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/spiffs/spiffs_cache.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/spiffs/spiffs_check.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/spiffs/spiffs_gc.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/spiffs/spiffs_hydrogen.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/vfs-fs-spiffs/src/spiffs/spiffs_nucleus.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/core/src/mgos_core.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-compat/src/Print.cpp /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-compat/src/WString.cpp /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-compat/src/mgos_arduino.cpp /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/onewire/src/mgos_onewire.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-onewire/src/mgos_arduino_onewire_c.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-onewire/src/OneWire.cpp /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/arduino-onewire/src/mgos_arduino_onewire.cpp /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/mgos_bt.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/mgos_bt_gap.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/mgos_bt_js.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/esp32/esp32_bt.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/esp32/esp32_bt_gap.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/esp32/esp32_bt_gattc.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/bt-common/src/esp32/esp32_bt_gatts.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/i2c/src/mgos_i2c_master.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/i2c/src/esp32/esp32_i2c_master.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/src/mos_mjs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/modules/mjs/mjs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/mjs/esp32/src/esp32_mjs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/http-server/src/mgos_http_server.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/pwm/src/mgos_pwm.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/pwm/src/mgos_pwm_rgb_led.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/pwm/src/esp32/esp32_pwm.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/src/mg_rpc.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/src/mg_rpc_channel.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/src/mg_rpc_channel_http.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-common/src/mgos_rpc.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-loopback/src/mg_rpc_channel_loopback.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-service-config/src/mgos_service_config.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-service-fs/src/mgos_service_fs.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/rpc-uart/src/mgos_rpc_channel_uart.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/src/mgos_wifi.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/src/mjs_wifi.c /data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/deps/wifi/src/esp32/esp32_wifi.c
APP_VERSION=1.4
BOARD=
BUILD_DIR=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/objs
ESP_IDF_EXTRA_COMPONENTS= bt esp_wifi wpa_supplicant esp_wifi wpa_supplicant 
ESP_IDF_SDKCONFIG_OPTS= CONFIG_FREERTOS_SUPPORT_STATIC_ALLOCATION=y  CONFIG_BT_ACL_CONNECTIONS=4 CONFIG_BT_BLE_DYNAMIC_ENV_MEMORY=y CONFIG_BT_BLE_SMP_ENABLE=y CONFIG_BT_BLUEDROID_ENABLED=y CONFIG_BT_BTC_TASK_STACK_SIZE=6144 CONFIG_BT_CLASSIC_ENABLED=n CONFIG_BT_DRAM_RELEASE=y CONFIG_BT_ENABLED=y CONFIG_BT_GATTS_ENABLE=y CONFIG_BT_GATTC_ENABLE=y CONFIG_BTDM_CONTROLLER_RUN_CPU=0 CONFIG_BT_SMP_ENABLE=y CONFIG_BT_RESERVE_DRAM=0x10000  CONFIG_WIFI_ENABLED=y CONFIG_ESP32_WIFI_SW_COEXIST_ENABLE=n CONFIG_ESP32_WIFI_STATIC_RX_BUFFER_NUM=4 CONFIG_ESP32_WIFI_DYNAMIC_RX_BUFFER_NUM=16 CONFIG_ESP32_WIFI_STATIC_TX_BUFFER=n CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER=y CONFIG_ESP32_WIFI_TX_BUFFER_TYPE=1 CONFIG_ESP32_WIFI_DYNAMIC_TX_BUFFER_NUM=16 CONFIG_ESP32_WIFI_NVS_ENABLED=y CONFIG_ESP32_WIFI_RX_BA_WIN=4 CONFIG_ESP32_PHY_CALIBRATION_AND_DATA_STORAGE=y CONFIG_ESP32_PHY_INIT_DATA_IN_PARTITION=n 
FFI_SYMBOLS=
FS_STAGING_DIR=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/fs
FW_DIR=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/fw
GEN_DIR=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/gen
MANIFEST_FINAL=/data/fwbuild-volumes/2.19.1/apps/volzhanin_esp32/esp32/build_contexts/build_ctx_957166421/build/gen/mos_final.yml
MGOS=1
MGOS_HAVE_ARDUINO_COMPAT=1
MGOS_HAVE_ARDUINO_ONEWIRE=1
MGOS_HAVE_BT_COMMON=1
MGOS_HAVE_CORE=1
MGOS_HAVE_FREERTOS=1
MGOS_HAVE_HTTP_SERVER=1
MGOS_HAVE_I2C=1
MGOS_HAVE_MBEDTLS=1
MGOS_HAVE_MJS=1
MGOS_HAVE_MONGOOSE=1
MGOS_HAVE_ONEWIRE=1
MGOS_HAVE_OTA_COMMON=1
MGOS_HAVE_OTA_HTTP_CLIENT=1
MGOS_HAVE_OTA_HTTP_SERVER=1
MGOS_HAVE_PWM=1
MGOS_HAVE_RPC_COMMON=1
MGOS_HAVE_RPC_LOOPBACK=1
MGOS_HAVE_RPC_SERVICE_CONFIG=1
MGOS_HAVE_RPC_SERVICE_FS=1
MGOS_HAVE_RPC_UART=1
MGOS_HAVE_VFS_COMMON=1
MGOS_HAVE_VFS_FS_LFS=1
MGOS_HAVE_VFS_FS_SPIFFS=1
MGOS_HAVE_WIFI=1
MGOS_HAVE_ZZ_BOARDS=1
MGOS_MBEDTLS_ENABLE_ATCA=0
MGOS_PATH=/mongoose-os
MGOS_ROOT_FS_OPTS_LFS={"bs":4096,"is":128}
MGOS_ROOT_FS_OPTS_SPIFFS={"bs":4096,"ps":256,"es":4096}
MGOS_WIFI_ENABLE_AP_STA=0
PLATFORM=esp32