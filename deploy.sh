#!/bin/sh -e

cd "`pwd`"

. ../esp-idf/export.sh
idf.py build monitor
