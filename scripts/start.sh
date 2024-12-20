#!/bin/bash

# Запуск Nginx для Mainsail
nginx

# Запуск Klipper
/opt/klippy-env/bin/python /opt/klipper/klippy/klippy.py /opt/printer_config/printer.cfg -l /tmp/klippy.log &

# Запуск Moonraker
/opt/moonraker-env/bin/python /opt/moonraker/moonraker/moonraker.py -c /opt/printer_config/moonraker.conf &

# Держим контейнер запущенным
tail -f /tmp/klippy.log 