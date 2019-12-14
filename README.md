# Sputnik: a low power [ESP32](https://www.esp32.com) temperature sensor firmware

I have been using my [Wemos D32 Pro](https://wiki.wemos.cc/products:d32:d32_pro) board with the [SHT30 temperature and humidity sensor](https://wiki.wemos.cc/products:d1_mini_shields:sht30_shield) to monitor a few rooms in my home using [MicroPython](https://micropython.org), and send these to [Adafruit IO](https://io.adafruit.com) over MQTT.

This is my attempt to rewrite this firmware using [the official SDK](https://github.com/espressif/esp-idf) directly and leveraging the [ULP](https://docs.espressif.com/projects/esp-idf/en/latest/api-guides/ulp.html) coprocessor to achieve minimal power consumption.
