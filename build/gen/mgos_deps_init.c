/* This file is auto-generated by mos build, do not edit! */

#include <stdbool.h>
#include <stdio.h>

#include "common/cs_dbg.h"

#include "mgos_app.h"

extern bool mgos_freertos_init(void);
extern bool mgos_mongoose_init(void);
extern bool mgos_ota_common_init(void);
extern bool mgos_vfs_common_init(void);
extern bool mgos_vfs_fs_lfs_init(void);
extern bool mgos_vfs_fs_spiffs_init(void);
extern bool mgos_core_init(void);
extern bool mgos_arduino_compat_init(void);
extern bool mgos_onewire_init(void);
extern bool mgos_arduino_onewire_init(void);
extern bool mgos_bt_common_init(void);
extern bool mgos_wifi_init(void);
extern bool mgos_http_server_init(void);
extern bool mgos_i2c_init(void);
extern bool mgos_mbedtls_init(void);
extern bool mgos_mjs_init(void);
extern bool mgos_ota_http_client_init(void);
extern bool mgos_ota_http_server_init(void);
extern bool mgos_pwm_init(void);
extern bool mgos_rpc_common_init(void);
extern bool mgos_rpc_service_config_init(void);
extern bool mgos_rpc_service_fs_init(void);
extern bool mgos_rpc_uart_init(void);


#ifndef MGOS_LIB_INFO_VERSION
struct mgos_lib_info {
  const char *name;
  const char *version;
  const char *repo_version;
  const char *binary_libs;
  bool (*init)(void);
};
#define MGOS_LIB_INFO_VERSION 2
#endif

#ifndef MGOS_MODULE_INFO_VERSION
struct mgos_module_info {
  const char *name;
  const char *repo_version;
};
#define MGOS_MODULE_INFO_VERSION 1
#endif

const struct mgos_lib_info mgos_libs_info[] = {

    // "freertos". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "freertos", .version = "10.2.0", .init = mgos_freertos_init},
#else
    {.name = "freertos", .version = "10.2.0", .repo_version = "f4b5ba5336f2f0fe3b183527790cf82e0644364e", .binary_libs = NULL, .init = mgos_freertos_init},
#endif

    // "mongoose". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "mongoose", .version = "6.18", .init = mgos_mongoose_init},
#else
    {.name = "mongoose", .version = "6.18", .repo_version = "24f3c520fdfd5d7c33ff2734d4be42aab75107e9", .binary_libs = "libmongoose-esp32-latest.a:30633862663730313839643137356438323930396564326134626165313134643162343137363430313764393735616531356230393964373736323631643035", .init = mgos_mongoose_init},
#endif

    // "ota-common". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "ota-common", .version = "1.2.2", .init = mgos_ota_common_init},
#else
    {.name = "ota-common", .version = "1.2.2", .repo_version = "aec392579bc990cc855f0ed5c32f813f283c4a8e", .binary_libs = "libota-common-esp32-latest.a:34376361663963396162363132313262393132363262636437353133396664313437363565666138376237653363323064343632363264646664633963626433", .init = mgos_ota_common_init},
#endif

    // "vfs-common". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "vfs-common", .version = "1.0", .init = mgos_vfs_common_init},
#else
    {.name = "vfs-common", .version = "1.0", .repo_version = "cbd2bd6506628a46d050dbd9d21c89e4329bfe0c", .binary_libs = NULL, .init = mgos_vfs_common_init},
#endif

    // "vfs-fs-lfs". deps: [ "vfs-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "vfs-fs-lfs", .version = "2.4.0", .init = mgos_vfs_fs_lfs_init},
#else
    {.name = "vfs-fs-lfs", .version = "2.4.0", .repo_version = "b611462e03d431f9541f50763b3153552db81861", .binary_libs = NULL, .init = mgos_vfs_fs_lfs_init},
#endif

    // "vfs-fs-spiffs". deps: [ "vfs-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "vfs-fs-spiffs", .version = "1.0", .init = mgos_vfs_fs_spiffs_init},
#else
    {.name = "vfs-fs-spiffs", .version = "1.0", .repo_version = "0c1d9d07a4bf900f08ca4a250e29e7f5931301c5", .binary_libs = NULL, .init = mgos_vfs_fs_spiffs_init},
#endif

    // "core". deps: [ "freertos" "mongoose" "ota-common" "vfs-common" "vfs-fs-lfs" "vfs-fs-spiffs" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "core", .version = "1.0", .init = mgos_core_init},
#else
    {.name = "core", .version = "1.0", .repo_version = "aab58b78602eda6587c2cc81b7981a91a28d3356", .binary_libs = NULL, .init = mgos_core_init},
#endif

    // "arduino-compat". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "arduino-compat", .version = "1.0", .init = mgos_arduino_compat_init},
#else
    {.name = "arduino-compat", .version = "1.0", .repo_version = "70b7ab229efd8518568bf9ad1ab0f319104e647a", .binary_libs = NULL, .init = mgos_arduino_compat_init},
#endif

    // "onewire". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "onewire", .version = "1.0", .init = mgos_onewire_init},
#else
    {.name = "onewire", .version = "1.0", .repo_version = "e90a2304cd7203184ef50904c2841cdf2b7a5390", .binary_libs = NULL, .init = mgos_onewire_init},
#endif

    // "arduino-onewire". deps: [ "arduino-compat" "core" "onewire" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "arduino-onewire", .version = "1.0", .init = mgos_arduino_onewire_init},
#else
    {.name = "arduino-onewire", .version = "1.0", .repo_version = "2957de8c451e7fb9df18349d682269318abb573f", .binary_libs = NULL, .init = mgos_arduino_onewire_init},
#endif

    // "bt-common". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "bt-common", .version = "1.0", .init = mgos_bt_common_init},
#else
    {.name = "bt-common", .version = "1.0", .repo_version = "db7ac4932b7137cb1c0983774d2f09c1ccaabccf", .binary_libs = NULL, .init = mgos_bt_common_init},
#endif

    // "wifi". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "wifi", .version = "1.0", .init = mgos_wifi_init},
#else
    {.name = "wifi", .version = "1.0", .repo_version = "d6a1a3159e3dac2b756b101a923560b01a2722be", .binary_libs = NULL, .init = mgos_wifi_init},
#endif

    // "http-server". deps: [ "core" "wifi" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "http-server", .version = "1.0", .init = mgos_http_server_init},
#else
    {.name = "http-server", .version = "1.0", .repo_version = "5b4c77fb71e151625470b09fe52a1b0dbddadc77", .binary_libs = NULL, .init = mgos_http_server_init},
#endif

    // "i2c". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "i2c", .version = "1.0", .init = mgos_i2c_init},
#else
    {.name = "i2c", .version = "1.0", .repo_version = "cd740fa1b33b4b01bacc5a86a51fbe5d27c33f9c", .binary_libs = NULL, .init = mgos_i2c_init},
#endif

    // "mbedtls". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "mbedtls", .version = "2.16.6-cesanta1", .init = mgos_mbedtls_init},
#else
    {.name = "mbedtls", .version = "2.16.6-cesanta1", .repo_version = "526bdaea881831975e90df231d9ea2b743616675", .binary_libs = NULL, .init = mgos_mbedtls_init},
#endif

    // "mjs". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "mjs", .version = "1.0.0", .init = mgos_mjs_init},
#else
    {.name = "mjs", .version = "1.0.0", .repo_version = "8d2f612a80763edb0610bf2ddbbc84ad63780044", .binary_libs = NULL, .init = mgos_mjs_init},
#endif

    // "ota-http-client". deps: [ "core" "ota-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "ota-http-client", .version = "1.0.1", .init = mgos_ota_http_client_init},
#else
    {.name = "ota-http-client", .version = "1.0.1", .repo_version = "d6088c559c603f74a645a8b0dff135723c994f2d", .binary_libs = "libota-http-client-esp32-latest.a:32356435313731616665646130393636323032363766326633343761393535646630626639323934363661636636363835343932626364323838656562643831", .init = mgos_ota_http_client_init},
#endif

    // "ota-http-server". deps: [ "core" "http-server" "ota-common" "ota-http-client" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "ota-http-server", .version = "1.0", .init = mgos_ota_http_server_init},
#else
    {.name = "ota-http-server", .version = "1.0", .repo_version = "6adb6f6bf66390a6adf7defb2f85c1f7d3aaea60", .binary_libs = "libota-http-server-esp32-latest.a:66623565666363336639646338376165626135643039343363656237393835613637626231353264636538376130626639323966336630623333303937373530", .init = mgos_ota_http_server_init},
#endif

    // "pwm". deps: [ "core" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "pwm", .version = "1.0", .init = mgos_pwm_init},
#else
    {.name = "pwm", .version = "1.0", .repo_version = "1e66234640b4877fbd190f4a482f084ffacb40a6", .binary_libs = NULL, .init = mgos_pwm_init},
#endif

    // "rpc-common". deps: [ "core" "http-server" "mongoose" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "rpc-common", .version = "1.0", .init = mgos_rpc_common_init},
#else
    {.name = "rpc-common", .version = "1.0", .repo_version = "743a423f5012f635d2050a15037dd72ce2e2ec03", .binary_libs = NULL, .init = mgos_rpc_common_init},
#endif

    // "rpc-service-config". deps: [ "core" "rpc-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "rpc-service-config", .version = "1.0", .init = mgos_rpc_service_config_init},
#else
    {.name = "rpc-service-config", .version = "1.0", .repo_version = "5d2c7836479ae0e9fafa74dad102cb277b85497d", .binary_libs = NULL, .init = mgos_rpc_service_config_init},
#endif

    // "rpc-service-fs". deps: [ "core" "rpc-common" "vfs-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "rpc-service-fs", .version = "1.0", .init = mgos_rpc_service_fs_init},
#else
    {.name = "rpc-service-fs", .version = "1.0", .repo_version = "39437663b14759671a37e9670a46c65e5519c369", .binary_libs = NULL, .init = mgos_rpc_service_fs_init},
#endif

    // "rpc-uart". deps: [ "core" "rpc-common" ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "rpc-uart", .version = "1.0", .init = mgos_rpc_uart_init},
#else
    {.name = "rpc-uart", .version = "1.0", .repo_version = "34442fa1081f912a70f72166229b570c0f5a0aa8", .binary_libs = NULL, .init = mgos_rpc_uart_init},
#endif

    // "zz_boards". deps: [ ]
#if MGOS_LIB_INFO_VERSION == 1
    {.name = "zz_boards", .version = NULL, .init = NULL},
#else
    {.name = "zz_boards", .version = NULL, .repo_version = "33d12fa93de257bed97066dfe1c19d484e73cbc8", .binary_libs = NULL, .init = NULL},
#endif

    // Last entry.
    {.name = NULL},
};

const struct mgos_module_info mgos_modules_info[] = {

    {.name = "mbedtls_module", .repo_version = "1e5cc8512a64afaa15f4adc7b8c91581e252e087"},

    {.name = "mjs_module", .repo_version = "52f4912e68cd5cd0ee3f0e02f0ad635d15b5e21e"},

    {.name = "mongoose-os", .repo_version = "0d4c00826160cab3e3eedad04d7138512ac4c83e"},

    // Last entry.
    {.name = NULL},
};

bool mgos_deps_init(void) {
  for (const struct mgos_lib_info *l = mgos_libs_info; l->name != NULL; l++) {
#if MGOS_LIB_INFO_VERSION == 1
    LOG(LL_DEBUG, ("Init %s %s...", l->name, (l->version ? l->version : "")));
#else
    LOG(LL_DEBUG, ("Init %s %s (%s)...",
          l->name,
          (l->version ? l->version : ""),
          (l->repo_version ? l->repo_version : "")));
#endif
    if (l->init != NULL && !l->init()) {
      LOG(LL_ERROR, ("%s init failed", l->name));
      return false;
    }
  }
  for (const struct mgos_module_info *m = mgos_modules_info; m->name != NULL; m++) {
    LOG(LL_DEBUG, ("Module %s %s", m->name, (m->repo_version ? m->repo_version : "")));
  }
  return true;
}
