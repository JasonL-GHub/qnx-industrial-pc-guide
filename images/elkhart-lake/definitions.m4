## Boot parameters
define(`__LD_QNX__',            `ldqnx-64.so.2')
define(`__BOOT_ADDR__',         `0x2000000')
define(`__ARCH__',              `x86_64')
define(`__TYPE__',              `uefi')
define(`__COMPRESS_ATTR__',     `+compress')
define(`__PROCNTO_MODULES__',   `')
define(`__STARTUP__',           `startup-x86')
define(`__STARTUP_OPTS__',      `')
define(`__PROCNTO__',           `procnto-smp-instr')
define(`__PROCNTO_OPTS__',      `')

## Console
define(`__CONSOLE__',           `/dev/ser1')

## add /root/.profile
define(`__ROOT_PROFILE__',      `')

## ENV profile, use to overwrite the common /etc/profile

## System Memory Management Unit (smmu)
ifdef(`__SMMU__', `
define(`__SMMU_USB_HOST_OPTS__', `-s smmu=on')
define(`__NET_CONF_FILE_NAME__', `iosock.conf')
define(`__NET_CONF_FILE_PATH__', `/etc/system/config/net')
define(`__NET_CONF_FILE_CONTENT__', `qnx.smmu="1"')
')

## Audio driver

## Block driver
define(`__BLOCK_DRVR__',        `devb-ahci, devb-nvme, devb-ram, devb-sdmmc')

define(`__DEVB_DRVR_START__', `
    ############################################################################################
    ## Block driver
    ############################################################################################
    display_msg "Starting SDMMC driver ..."
    devb-sdmmc cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') sdio idx=0,vid=0x8086,did=0x4b47,irq=16 disk name=emmc
    waitfor /dev/emmc0

    devb-sdmmc cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') sdio idx=0,vid=0x8086,did=0x4b48,irq=17 disk name=sd
    waitfor /dev/sd0

    ## Start SATA / NVMe driver if device exists
    ksh /proc/boot/blk-start.sh
')

## Network driver
#define(`__NET_DRVR__',          `')
#define(`__NET_OPTS__',          `')
#define(`__NET_DEV__',           `')

## USB host driver
define(`__USB_HOST_DRVR__',     `devu-hcd-ehci.so, devu-hcd-ohci.so, devu-hcd-uhci.so, devu-hcd-xhci.so')
define(`__USB_HOST_OPTS__',     `ifdef(`__SMMU_USB_HOST_OPTS__', `__SMMU_USB_HOST_OPTS__') -d xhci -d ehci -d ohci -d uhci')
define(`__USB_HOST_DEV__',      `/dev/usb/io-usb-otg')

## Persistent storge
define(`__PERSISTENT_STORAGE_DEVICE__', `/dev/umass0t179')
#define(`__PERSISTENT_STORAGE_MOUNT_POINT__', `/')
define(`__PERSISTENT_STORAGE_MOUNT_OPTS__', `-t qnx6 -o sync=optional')
#define(`__PERSISTENT_STORAGE_START__', `')
#define(`__PERSISTENT_STORAGE_FILES__', `')

## Serial driver
define(`__DEVC_DRVR__',         `devc-serpci, devc-serusb')
#define(`__DEVC_OPTS__',         `')
#define(`__DEVC_DEV__',          `')

define(`__DEVC_START__', `
    ############################################################################################
    ## Serial driver
    ############################################################################################
    display_msg "Starting serial driver ..."
    devc-serpci vid=0x8086,did=0x4b96,pci=0 -e -b115200 ifdef(`__SMMU__', `-o smmu=on')
    waitfor /dev/ser1

    devc-serpci vid=0x8086,did=0x4b4d,pci=0 -e -b115200 ifdef(`__SMMU__', `-o smmu=on')
    waitfor /dev/ser2
    TERM=qansi on -t /dev/ser2 /bin/ksh
')

## CAN driver

## I2C driver
define(`__I2C_DRVR__',          `i2c-baytrail')
define(`__I2C_OPTS__',          `-d 0x4b7b -r 0x8086 -q 30 --u3, -d 0x4b4b -r 0x8086 -q 31 --u4')
define(`__I2C_DEV__',           `/dev/i2c3, /dev/i2c4')

## PCI driver
define(`__PCI_HW_DRVR__',       `pci_hw-Intel_x86.so')
define(`__PCI_HW_MODULE__',     `pci_hw-Intel_x86.so')
define(`__PCI_OPTS__',          `--aspace-enable')

## Note: disable the PCI server in template script, And start it in BOARD_EARLY_START
## Because all drivers need PCI server
define(`__PCI_START__',         `dnl')

## SPI driver
define(`__IO_SPI_DRVR__',          `spi-pxa')
define(`__IO_SPI_CFG_CONTENTS__', `
[globals]
verbose=5

[bus]
busno=1
name=spi1
irq=19
input_clock=1000000
# PIO exchange mode
bs=idx=0,vid=0x8086,did=0x4b2b

# DMA exchange mode
#bs=dma,idx=0,vid=0x8086,did=0x4b2b

#loop back mode for test
#bs=idx=0,vid=0x8086,did=0x4b2b,loopback

[dev]
parent_busno=1
devno=0
name=dev0
clock_rate=100000
cpha=1
')

## Random
#define(`__RANDOM_DRVR__',       `')
#define(`__RANDOM_DRVR_OPTS__',  `')

## DMA
#define(`__DMA_DRVR__',          `')

## RTC
define(`__RTC_DRVR__',          `rtc')
define(`__RTC_OPTS__',          `hw')

define(`__RTC_START__', `
    ############################################################################################
    ## RTC utility
    ############################################################################################
    display_msg "Starting RTC ..."
    __RTC_DRVR__ __RTC_OPTS__
')

## WDT kick
#define(`__WDT_DRVR__',          `')
#define(`__WDT_OPTS__',          `')
#define(`__WDT_START__',         `')

## Device tree blob
#define(`__DTB_FILE__',          `')

## Customize script
define(`__CUSTOMIZE_SCRIPT_NAME__', `/scripts/board_startup.sh')
#define(`__CUSTOMIZE_SCRIPT_START__', `')
#define(`__CUSTOMIZE_SCRIPT_FILES__', `')

## Board specific files
define(`__BOARD_EARLY_START__', `
    ############################################################################################
    ## PCI Server
    ############################################################################################
    PCI_DEBUG_MODULE=/lib/dll/pci/pci_debug2.so
    PCI_SLOG_MODULE=/lib/dll/pci/pci_slog2.so
    PCI_BKWD_COMPAT_MODULE=/lib/dll/pci/pci_bkwd_compat.so
    PCI_HW_MODULE=/lib/dll/pci/pci_hw-Intel_x86.so

    display_msg "Starting PCI server ..."
    pci-server --aspace-enable
    waitfor /dev/pci
')

define(`__BOARD_LATE_START__', `
    ############################################################################################
    ## Debug console
    ############################################################################################
    ksh /proc/boot/debug-console.sh &
')

define(`__BOARD_FILES__', `
################################################################################################
## Debug console
################################################################################################
debug-console.sh = {
#!/bin/ksh

USB_DEVICE_LIST=/dev/shmem/usb_device.list

## check if connect the USB-Serial Controller to your target
x=1
while [ $x -le 5 ]
do
    usb > $USB_DEVICE_LIST

    if  grep "USB-Serial" $USB_DEVICE_LIST > /dev/null  || \
        grep "USB UART"   $USB_DEVICE_LIST > /dev/null  || \
        grep "usb serial" $USB_DEVICE_LIST > /dev/null
    then
        if [ ! -e /dev/serusb1 ]; then
            echo "Starting USB serial driver ..."
            devc-serusb -e -b115200 ifdef(`__SMMU__', `-o smmu=on')
            waitfor /dev/serusb1
            TERM=qansi on -t /dev/serusb1 /bin/ksh
        fi

        break
    fi

    x=$(( $x + 1 ))
    sleep 1;
done
}

################################################################################################
## Script for launching the block driver
################################################################################################
blk-start.sh={
#!/bin/ksh

PCI_DEVICE_LIST=/dev/shmem/pci_device.list
STD_NULL=/dev/null

## check if there is the pci device list
if [ ! -r $PCI_DEVICE_LIST ]; then
    pci-tool -v > $PCI_DEVICE_LIST
fi

# redirect stderr to slog2
exec 2> /dev/console

# check if there is the NVMe device in the list
if  grep "Non-volatile Memory Subsystem (NVMe Interface IO Controller)" $PCI_DEVICE_LIST > $STD_NULL
then
    echo "Starting NVMe block driver ..."
    devb-nvme cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') disk name=nvme
    waitfor /dev/nvme0 3
fi

# check if there is the SATA device in the list
if  grep "SATA Mass Storage Controller (AHCI Interface)" $PCI_DEVICE_LIST > $STD_NULL
then
    echo "Starting AHCI block driver ..."
    devb-ahci cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') disk name=sata
    waitfor /dev/sata0 3
fi
}

################################################################################################
## END OF BUILD SCRIPT
################################################################################################
')
