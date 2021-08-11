Copyright (C) 2020 The LineageOS Project
 
The Mi A2 Lite (codenamed _"daisy"_) smartphone from Xiaomi.

The Xiaomi Mi A2 Lite was announced and released in July 2018.

## Device specifications

| Device       | Xiaomi Mi A2 Lite                               |
| -----------: | :---------------------------------------------- |
| SoC          | Qualcomm MSM8953 Snapdragon 625                 |
| CPU          | Octa-core 2.0 GHz Cortex-A53                    |
| GPU          | Adreno 506                                      |
| Memory       | 3/4 GB                                          |
| Shipped Android version | 8.1.0                                |
| Storage      | 32/64 GB                                        |
| Battery      | Non-removable Li-Po 4000 mAh                    |
| Dimensions   | 149.3 x 71.7 x 8.8 mm                           |
| Display      | 1080 x 2280 pixels (~432 ppi)                   |

## Bugs

Working:
- Touch, screen
- Flashing ZIP files (including A/B zips like ROMs)
- Installing IMG files to respective partitions
- Backup, restore to Internal Storage, Micro SD Card, USB OTG
- Shutdown, Reboot to System, Recovery, Fastboot
- Micro SD card 
- ADB, MTP
- Date, Time, Temperature, battery reading
- Decryption (QTI Keymaster 3.0) 

Broken:
- Nothing except decryption in ROMs using keymaster 4.0 (QTI or AOSP) and keymaster 3.0 (AOSP). Keymaster 4.0 will run in "legacy" mode anyways as the device's firmware doesn't support keymaster 4.0 features. AOSP keymaster decryption is not supported since TWRP is built based on Android Pie.

## Device picture

![Xiaomi Mi A2 Lite](https://i01.appmifile.com/webfile/globalimg/products/pc/D1S/black_phone.png "Xiaomi Mi A2 Lite in black")