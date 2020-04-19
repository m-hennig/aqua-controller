#!/usr/bin/env bash
tools/esptool.py --chip esp32 --port $1 --baud 921600 erase_flash
tools/esptool.py --chip esp32 --port $1 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_freq 80m --flash_mode dio --flash_size 4MB \
0x1000 firmware_old/bootloader.bin \
0x8000  firmware_old/partitions.bin \
0xe000  firmware_old/boot_app0.bin \
0x10000  firmware_old/firmware.bin
0x291000 firmware/spiffs.bin