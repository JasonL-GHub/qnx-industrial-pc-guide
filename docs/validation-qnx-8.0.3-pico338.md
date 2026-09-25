[**Back to PICO338 BSP**](../README.md)


---


# Test Guide

This guide describes the basic functional tests performed on the Axiomtek PICO338 platform running QNX 8.0.3.

* [Basic Function Test Items](#basic-function-test-items)
    - [Storage](#storage)
        - [NVMe](#nvme) 
    - [Display](#display)
    - [Ethernet](#ethernet)
    - [USB](#usb)
    - [COM](#com)
    - [SMBus](#smbus)
    - [Digital I/O Connector (CN1)](#digital-io-connector-cn1)
    - [Watchdog](#watchdog)
    - [M.2 Key B Connector (CN4)](#m2-key-b-connector-cn4)  
    - [M.2 Key E Connector (CN7)](#m2-key-e-connector-cn7)
    - [HD Audio Wafer Connector (CN10)](#hd-audio-wafer-connector-cn10)
    - [SIM Card Wafer Connector (SCN1)](#sim-card-wafer-connector-scn1)
    

> **Note:**

Test platform:  PICO338-N97-8GH (P/N-E38H338108)




# Basic Function Test Items


---


## Storage


<div align="right">

[**Back to Top**](#test-guide)

</div>

### NVMe




<div align="right">

[**Back to Top**](#test-guide)

</div>

Check the `/dev` directory to verify that the **NVMe** device is detected:


```text
#
# ls -al /dev/nvme*
brw-------  1 root root 4,   0 2021-01-02 01:06 /dev/nvme0
#
```

Use `pci-tool -v` to verify that the **NVMe** controller is detected:

```text
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/4678
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

B000:D02:F00 @ idx 1
        vid/did: 8086/46d1
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 03/00/00
                PC Compatible VGA Display Controller

.
.
.
B001:D00:F00 @ idx 15 in slot 4 of chassis 0
        vid/did: 1d79/2263
                <vendor id - unknown>, <device id - unknown>
        class/subclass/reg: 01/08/02
                Non-volatile Memory Subsystem (NVMe Interface IO Controller)
.
.
.

B003:D00:F00 @ idx 17 in slot 14 of chassis 0
        vid/did: 8086/125c
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller
```



<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Display



<div align="right">

[**Back to Top**](#test-guide)

</div>



|Display Interface|Connector Name|DisplayName shown in QNX8.0|Intel® Processor N97|
| :---: | :---: | :---: | :---: | 
|LVDS|CN6,CN5|display 1: embedded DisplayPort (eDP-1)|unknown|
|HDMI|CN9|display 2: HDMI-A (HDMI-A-1)|OK|

> **NOTE:**

Cannot find a monitor with LVDS interface for testing. 


![HDMI-CN9-demo-1](./pics/HDMI-CN9-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![HDMI-CN9-demo-2](./pics/HDMI-CN9-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Run the following commands to start the display demo:

```console
# cd scripts
# ls
graphics_start.sh
# pwd
/scripts
```console
# cat graphics_start.sh
  #!/bin/sh 
  LD_LIBRARY_PATH=/lib:/usr/lib:/lib/dll:/lib/dll/pci:/proc/boot:/usr/lib/graphics/drm-i915
  PATH=/sbin:/bin:/usr/sbin:/usr/bin:/opt/sbin:/opt/bin:/proc/boot 
  echo "Starting screen" 
  drm-i915
  screen -c /usr/lib/graphics/drm-i915/graphics.conf 
  waitfor /dev/screen 
```

![display-graphics](./pics/display-graphics.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![Inverter-connector-CN5-demo-1](./pics/Inverter-connector-CN5-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LVDS-CN6-demo-1](./pics/LVDS-CN6-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![LVDS-CN6-demo-2](./pics/LVDS-CN6-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LVDS-CN6-demo-3](./pics/LVDS-CN6-demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![LVDS-CN5-CN6-demo](./pics/LVDS-CN5-CN6-demo.png)




<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Ethernet



<div align="right">

[**Back to Top**](#test-guide)

</div>



The board provides two Ethernet ports: LAN1, LAN2.

![ethernets-demo-1](./pics/ethernets-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![ethernet1-testing](./pics/ethernet1-testing.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![ethernet2-testing](./pics/ethernet2-testing.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>




### Throughput Test



<div align="right">

[**Back to Top**](#test-guide)

</div>


Use `iperf3` to test Ethernet network throughput. In this example, the **PICO338** operates as the client, while the Linux test machine operates as the server.


![pico338-network-throughput-test-as-a-client](./pics/pico338-network-throughput-test-as-a-client.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![Linux-build-machine-as-server-in-network-throughput-testing](./pics/Linux-build-machine-as-server-in-network-throughput-testing.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## USB



<div align="right">

[**Back to Top**](#test-guide)

</div>




|USB Interface Type|Connector Name|
| :---: | :---: |  
|USB2.0|CN2|
|USB3.2|USB1|






### USB2.0 Wafer Connector (CN2)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![USB2-demo-1](./pics/USB2-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>




![USB2-demo-2](./pics/USB2-demo-2.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>




![usb2_port_testing](./pics/usb2_port_testing.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


A USB 2.0 wafer cable is required for testing:

**P/N:** 594E8422800 - 2 USB 2.0 wafer cables with bracket, 180 mm


#### USB 2.0 Write Test with `fsync`



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 2.0 write test using `fsync` with a USB 2.0 flash drive.


![usb2_port_writing_test_with_fsync](./pics/usb2_port_writing_test_with_fsync.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


#### USB 2.0 Write Test without `fsync`



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 2.0 write test without `fsync` using a USB 2.0 flash drive.

![usb2_port_writing_test_without_fsync](./pics/usb2_port_writing_test_without_fsync.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


#### USB 2.0 Read Test



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 2.0 read test using a USB 2.0 flash drive.


![usb2_port_reading_test](./pics/usb2_port_reading_test.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



### USB 3.2 Connector (USB1)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![USB3.2-demo-1](./pics/USB3.2-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![usb3-ports-testing](./pics/usb3-ports-testing.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### USB 3.2 Write Test with `fsync`



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 3.2 write test using `fsync` with a USB 3.0 flash drive.

![usb3_port_writing_test_with_fsync](./pics/usb3_port_writing_test_with_fsync.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### USB 3.2 Write Test without `fsync`



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 3.2 write test without fsync using a USB 3.0 flash drive.


![usb3_port_writing_test_without_fsync](./pics/usb3_port_writing_test_without_fsync.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### USB 3.2 Read Test with `fsync`



<div align="right">

[**Back to Top**](#test-guide)

</div>




Perform a USB 3.2 read test with `fsync` using a USB 3.0 flash drive.


![usb3_port_reading_test](./pics/usb3_port_reading_test.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## COM



<div align="right">

[**Back to Top**](#test-guide)

</div>




![COM-demo-1](./pics/COM-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![COM-demo-2](./pics/COM-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![COM-demo-3](./pics/COM-demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Connect the USB end of the USB-to-RS232 (male) cable to the PC.

```console
# cd dev
# pwd
/dev
# ls -l ser*
crw-rw-rw-  1 root root 3,   1 2025-02-21 06:36 ser1
...
#
```



Assume that COM1 is connected to the test device.

```console
# echo hello > /dev/ser1
hello
```

<div align="right">

[**Back to Top**](#test-guide)

</div>


---

## SMBus



<div align="right">

[**Back to Top**](#test-guide)

</div>



![smbus-scn2-demo-1](./pics/smbus-scn2-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![SMbus-SCN2-demo-2](./pics/SMbus-SCN2-demo-2.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![SMBus-demo-1](./pics/SMBus-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---

## Digital I/O Connector (CN1)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![DIO-demo-1](./pics/DIO-demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![DIO-demo-2](./pics/DIO-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


A shared library has been created to support DIO configuration. **Pins 1–4** can be configured as either **inputs** or **outputs**.

Two test applications are provided as examples:

- `pico338_dio_read_test`
- `pico338_dio_write_test`

### Input Test 

Verify that the DIO input pins can correctly detect their grounded and ungrounded states.

```text
# ls
bin  etc   lib   root  scripts  tmp  var
dev  home  proc  sbin  sys      usr
# ls -al /usr/bin/pico338_dio*
-rwxr-xr-x  1 root root 8192 2025-11-20 23:46 /usr/bin/pico338_dio_read_test
-rwxr-xr-x  1 root root 8192 2025-11-20 23:45 /usr/bin/pico338_dio_write_test
#
```

#### No Pins Grounded

Leave **Pins 1–4** ungrounded. All input pins should remain in the pull-up state.

![DIO-test-no-pins-grounded](./pics/DIO-test-no-pins-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 1 Grounded


Connect **Pin 6** to **Pin 1** to ground Pin 1.

![DIO-terst-P1-grounded](./pics/DIO-terst-P1-grounded.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 2 Grounded

Connect **Pin 6** to **Pin 2** to ground Pin 2.


![DIO-test-P2-grounded](./pics/DIO-test-P2-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 3 Grounded


Connect **Pin 6** to **Pin 3** to ground Pin 3.


![DIO-test-P3-grounded](./pics/DIO-test-P3-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 4 Grounded


Connect **Pin 6** to **Pin 4** to ground Pin 4.


![DIO-test-P4-grounded](./pics/DIO-test-P4-grounded.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


### Output Test



<div align="right">

[**Back to Top**](#test-guide)

</div>




Use the `pico338_dio_write_test` application to test the DIO output pins:

![DIO-output-test](./pics/DIO-output-test.png)

Use a multimeter to verify the output voltage levels of **Pins 1-4**.


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## Watchdog



<div align="right">

[**Back to Top**](#test-guide)

</div>



The `WDTRST#` signal is generated by the `F81804` Super I/O controller.

A shared library, `libpico338_wdt.so`, has been created to support the watchdog function.

The following is an example using this library:

![pico338-watchdog-demo](./pics/pico338-watchdog-demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## M.2 Key B Connector (CN4)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![M2-Key-B-Connector-CN4-demo1](./pics/M2-Key-B-Connector-CN4-demo1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![CN4-demo-2](./pics/CN4-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Insert a storage module (NVMe, **Transcend TS128GMTE452T2**) into the **CN4 M.2 Key B connector**.

Check the `/dev` directory to verify that the NVMe device is detected:

```text
#
# ls -al /dev/nvme*
brw-------  1 root root 4,   0 2021-01-02 01:06 /dev/nvme0
#
```


Use `pci-tool -v` to verify that the NVMe controller is detected:


```text
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/4678
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

B000:D02:F00 @ idx 1
        vid/did: 8086/46d1
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 03/00/00
                PC Compatible VGA Display Controller

.
.
.
B001:D00:F00 @ idx 15 in slot 4 of chassis 0
        vid/did: 1d79/2263
                <vendor id - unknown>, <device id - unknown>
        class/subclass/reg: 01/08/02
                Non-volatile Memory Subsystem (NVMe Interface IO Controller)
.
.
.

B003:D00:F00 @ idx 17 in slot 14 of chassis 0
        vid/did: 8086/125c
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller
```

<div align="right">

[**Back to Top**](#test-guide)

</div>



## M.2 Key E Connector (CN7)



<div align="right">

[**Back to Top**](#test-guide)

</div>



Insert the **Intel® Wi-Fi module (Model: 9260NGW)** into the **CN7 M.2 Key E** connector.

Use `pci-tool -v` to verify that the Wi-Fi module is detected:

```console
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/4678
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

B000:D02:F00 @ idx 1
        vid/did: 8086/46d1
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 03/00/00
                PC Compatible VGA Display Controller

.
.
.
B003:D00:F00 @ idx 17 in slot 15 of chassis 0
        vid/did: 8086/2526
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/80/00
                Other Network Controller
```

![M2-key-E-connector-CN7-demo-1](./pics/M2-key-E-connector-CN7-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![M2-Key-E-connector-CN7-demo-2](./pics/M2-Key-E-connector-CN7-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


## HD Audio Wafer Connector (CN10)




<div align="right">

[**Back to Top**](#test-guide)

</div>



![audio-CN10-demo-1](./pics/audio-CN10-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![audio-CN10-demo-2](./pics/audio-CN10-demo-2.png)


Under **QNX 8.0**, the audio interface is not supported.

<div align="right">

[**Back to Top**](#test-guide)

</div>


## SIM Card Wafer Connector (SCN1)


<div align="right">

[**Back to Top**](#test-guide)

</div>






![SIM-card-SCN1-demo-1](./pics/SIM-card-SCN1-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![SIM-card-SCN1-demo-2](./pics/SIM-card-SCN1-demo-2.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>

---

[**Back to PICO338 BSP**](../README.md)
