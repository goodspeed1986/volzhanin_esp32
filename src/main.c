/*
 * Copyright (c) 2014-2018 Cesanta Software Limited
 * All rights reserved
 *
 * Licensed under the Apache License, Version 2.0 (the ""License"");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an ""AS IS"" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "mgos.h"
#include <stdio.h>
#include <string.h>
//#include "common/mg_str.h"


static void timer_cb(void *arg) {
  static bool s_tick_tock = false;
  LOG(LL_INFO,
      ("%s uptime: %.2lf, RAM: %lu, %lu free", (s_tick_tock ? "Tick" : "Tock"),
       mgos_uptime(), (unsigned long) mgos_get_heap_size(),
       (unsigned long) mgos_get_free_heap_size()));
  s_tick_tock = !s_tick_tock;
#ifdef LED_PIN
  mgos_gpio_toggle(LED_PIN);
#endif
  (void) arg;
}

enum mgos_app_init_result mgos_app_init(void) {
#ifdef LED_PIN
  mgos_gpio_setup_output(LED_PIN, 0);
#endif
  mgos_set_timer(10000 , MGOS_TIMER_REPEAT, timer_cb, NULL);
  return MGOS_APP_INIT_SUCCESS;
}


/*
double sum (double a, double b) {
  return a + b;
}

void s2hexS(char* input, char* output)
{
    int loop;
    int i; 
    
    i=0;
    loop=0;
    
    while(input[loop] != '\0')
    {
        sprintf((char*)(output+i),"%02X", input[loop]);
        loop+=1;
        i+=2;
    }
    //insert NULL at the end of the output string
    output[i++] = '\0';
}

const char *foo(struct mg_str *data) {
  //static char s_name[] = "1234567\0";
  static char ascii_str[50];
  static char hex_str[70];
  //int len = strlen(data->len);
  size_t len = data->len;
  memcpy(ascii_str, data->p, len);
  s2hexS(ascii_str, hex_str);
  //ascii_str[len] = '\0';
  return hex_str;
}

const char *foo1(struct mg_str *data, int offset, int mtu) {
  size_t len = data->len;
  char *arr = malloc(len-offset);
  if (len < offset) {
        len = 0;
      } else {
        len = data->len - offset;
      }
      len = MIN(len, mtu - 1);
  memcpy(arr, data->p+offset, len);
  free(arr);
  return 
}

const char *allocStr(int size) {
  char *arr = (char*)malloc(size);
  return arr;
}
*/
/*void *my_dlsym(void *handle, const char *name) {
  if (strcmp(name, "foo") == 0) return foo;
  return NULL;
}*/
