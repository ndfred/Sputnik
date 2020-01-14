#!/bin/sh -e

cd "`pwd`"

ESP_SDK_PATH="esp-idf"
ESP_SDK_VERSION="v4.0-beta2"

check_command() {
  if ! command -v "$1" > /dev/null
  then
    echo "Please install $1, see this page for details:"
    echo "https://docs.espressif.com/projects/esp-idf/en/latest/get-started/macos-setup.html"
    exit 1
  fi
}

# See https://docs.espressif.com/projects/esp-idf/en/latest/get-started/#get-started-get-esp-idf
check_command xcrun
check_command python
check_command pip
check_command cmake
check_command ninja

# Latest releases in https://github.com/espressif/esp-idf/tags
if [ ! -f "$ESP_SDK_PATH/$ESP_SDK_VERSION" ]
then
  echo "Cloning ESP SDK $ESP_SDK_VERSION in $ESP_SDK_PATH"
  rm -rf "$ESP_SDK_PATH"
  git clone --recursive --depth 1 --branch "$ESP_SDK_VERSION" https://github.com/espressif/esp-idf.git "$ESP_SDK_PATH"
  "./$ESP_SDK_PATH/install.sh"
  touch "$ESP_SDK_PATH/$ESP_SDK_VERSION"
fi

. "$ESP_SDK_PATH/export.sh"
idf.py build monitor
