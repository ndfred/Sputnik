#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"
#include "esp32/ulp.h"
#include "ulp_read_sensor.h"

extern const uint8_t bin_start[] asm("_binary_ulp_read_sensor_bin_start");
extern const uint8_t bin_end[]   asm("_binary_ulp_read_sensor_bin_end");

void app_main()
{
    // https://docs.espressif.com/projects/esp-idf/en/v4.0-beta2/api-guides/ulp.html
    ESP_ERROR_CHECK(ulp_load_binary(0, bin_start, (bin_end - bin_start) / sizeof(uint32_t)));
}
