## Boot parameters
define(`__LD_QNX__',            `ldqnx-64.so.2')
define(`__BOOT_ADDR__',         `0x2000000')
define(`__ARCH__',              `x86_64')
define(`__TYPE__',              `bios')
define(`__COMPRESS_ATTR__',     `+compress')
define(`__PROCNTO_MODULES__',   `')
define(`__STARTUP__',           `startup-x86')
define(`__STARTUP_OPTS__',      `')
define(`__PROCNTO__',           `procnto-smp-instr')
define(`__PROCNTO_OPTS__',      `')

## Console
define(`__CONSOLE__',           `/dev/con1')

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
define(`__BLOCK_DRVR__',        `devb-ahci, devb-eide, devb-nvme, devb-ram, devb-sdmmc')

define(`__DEVB_DRVR_START__', `
    ############################################################################################
    ## Block driver
    ############################################################################################
    ksh /proc/boot/blk-start.sh
')

## Network driver
define(`__NET_DRVR__',          `devs-vmx.so')
define(`__NET_OPTS__',          `-d vmx')
define(`__NET_DEV__',           `vmx0')

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
define(`__DEVC_DRVR__',         `devc-ser8250, devc-serusb, devc-serpci')
#define(`__DEVC_OPTS__',         `')
#define(`__DEVC_DEV__',          `')

define(`__DEVC_START__', `
    ############################################################################################
    ## Serial driver
    ############################################################################################
    display_msg "Starting serial driver ..."
    devc-ser8250 -e -b115200 ifdef(`__SMMU__', `-o smmu=on')
    waitfor /dev/ser1
')

## CAN driver

## I2C driver

## PCI driver
define(`__PCI_HW_DRVR__',       `pci_hw-AMD_x86.so, pci_hw-Intel_x86.so')
define(`__PCI_HW_MODULE__',     `pci_hw-Intel_x86.so')
define(`__PCI_OPTS__',          `--aspace-enable')

## Note: disable the PCI server in template script, And start it in BOARD_EARLY_START
## Because all drivers need PCI server
define(`__PCI_START__',         `dnl')

## SPI driver

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

    ############################################################################################
    ## Input service
    ############################################################################################
    display_msg "Starting input service ..."
    io-hid -d usb
    waitfor /dev/io-hid/io-hid

    ############################################################################################
    ## Consoles and shells
    ############################################################################################
    display_msg "Starting consoles ..."
    devc-con-hid -n8
    waitfor /dev/con1
    waitfor /dev/con2
    waitfor /dev/con3
    waitfor /dev/con4
    waitfor /dev/con5
    waitfor /dev/con6
    waitfor /dev/con7
    waitfor /dev/con8

    reopen /dev/con2
    [+session] sh &

    reopen /dev/con3
    [+session] sh &

    reopen /dev/con4
    [+session] sh &

    reopen /dev/con5
    [+session] sh &

    reopen /dev/con6
    [+session] sh &

    reopen /dev/con7
    [+session] sh &

    reopen /dev/con8
    [+session] sh &
')

define(`__BOARD_FILES__', `
################################################################################################
## Libraries for io-hid drivers
################################################################################################
/lib/dll/devh-usb.so=devh-usb.so
/lib/dll/devh-ps2ser.so=devh-ps2ser.so

################################################################################################
## Console and io-hid drivers
################################################################################################
/sbin/devc-con=devc-con
/sbin/devc-con-hid=devc-con-hid
/sbin/io-hid=io-hid

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

## supported list for the EIDE block devices
EIDE_8086_7111=8086/7111

## supported list for the SDMMC block devices
SDMMC_8086_5acc=8086/5acc

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

# check if there is the EIDE device in the list
if grep $EIDE_8086_7111 $PCI_DEVICE_LIST > $STD_NULL
then
    echo "Starting EIDE block driver ..."
    devb-eide cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') disk name=eide
    waitfor /dev/eide0 3
fi

# check if there is the SDMMC device in the list
if  grep $SDMMC_8086_5acc $PCI_DEVICE_LIST > $STD_NULL
then
    echo "Starting SDMMC block driver ..."
    devb-sdmmc cam ifdef(`__SMMU__', `pnp,smmu=on', `pnp') sdio idx=0,vid=0x8086,did=0x5acc disk name=sdmmc
    waitfor /dev/sdmmc0 3
fi
}

################################################################################################
## END OF BUILD SCRIPT
################################################################################################
')
