[**Back to IMB540 BSP**](../README.md)


---


# Test Guide

This guide describes the basic functional tests performed on the Axiomtek IMB540 platform running QNX 8.0.3.

* [Basic Function Test Items](#basic-function-test-items)
    - [Storage](#storage)
        - [NVMe](#nvme)
        - [SATA](#sata)
    - [Display](#display)
    - [Ethernet](#ethernet)
    - [USB](#usb)
    - [COM](#com)
    - [SMBus](#smbus)
    - [Digital I/O Connector (CN7)](#digital-io-connector-cn7)
    - [Watchdog](#watchdog)
    - [Hardware Monitor](#hardware-monitor)
    - [PCI Express Mini Card Connector (CN16)](#pci-express-mini-card-connector-cn16)
    - [PCI Express/PCI Slots](#pci-expresspci-slots)
        - [PCI Express x4 Slots (PCIe2, PCIe3, PCIe5)](#pci-express-x4-slots-pcie2-pcie3-pcie5)
        - [PCI Express x16 Slots (PCIe1, PCIe4)](#pci-express-x16-slots-pcie1-pcie4)
        - [PCI Slots (PCI1, PCI2)](#pci-slots-pci1-pci2)
    - [Audio Jack](#audio-jack)
    

> **Note:**

Test platform:  IMB540 + I7-14700T (Raptor-Lake)



---



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

 



![CN10-NVMe-demo-1](./pics/CN10-NVMe-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


Insert an NVMe card and transfer the QNX image to it.

After booting the system from the NVMe card, check the `/dev` directory:

![CN10-NVMe-demo-2](./pics/CN10-NVMe-demo-2.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>




### SATA



<div align="right">

[**Back to Top**](#test-guide)

</div>




![SATA-connectors-demo-1](./pics/SATA-connectors-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


Connect a test SATA drive to the board, then check the `/dev` directory to verify 
that the SATA device is detected.


![SATA-connectors-demo-2](./pics/SATA-connectors-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Display



<div align="right">

[**Back to Top**](#test-guide)

</div>




|Display Interface|Connector Name|CPU|Graphics| 
| :---: | :---: | :---: | :---: | 
|HDMI|CN2|I7-14700T|OK|
|DisplayPort++|CN2|I7-14700T|OK|
|VGA|CN3|I7-14700T|OK|
|DVI-D|CN3|I7-14700T|OK|


Run the following commands to start the graphics demo:

```text
# ls
bin  dev  etc  home  lib  proc  root  sbin  scripts  tmp  usr  var

# cd scripts
# ./start-graphics.sh
Starting screen
```


![display-graphics](./pics/display-graphics.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Ethernet



<div align="right">

[**Back to Top**](#test-guide)

</div>




The board provides two Ethernet ports: LAN1, LAN2.

![LAN-CN5-CN6-demo-1](./pics/LAN-CN5-CN6-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![LAN-CN5-CN6-demo-2](./pics/LAN-CN5-CN6-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### LAN1




<div align="right">

[**Back to Top**](#test-guide)

</div>



![Ethernet-CN5-igb-demo-1](./pics/Ethernet-CN5-igb-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![Ethernet-CN5-igb-demo-2](./pics/Ethernet-CN5-igb-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### LAN2



<div align="right">

[**Back to Top**](#test-guide)

</div>



![Ethernet-CN6-igc-demo-1](./pics/Ethernet-CN6-igc-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![Ethernet-CN6-igc-demo-2](./pics/Ethernet-CN6-igc-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



### Throughput Test



<div align="right">

[**Back to Top**](#test-guide)

</div>

 




Use `iperf3` to test Ethernet network throughput. In this example, the **IMB540** operates as the client, while the Linux test machine operates as the server.


![iperf3-server-side-pc](./pics/iperf3-server-side-pc.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![iperf3-client-imb540](./pics/iperf3-client-imb540.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## USB



<div align="right">

[**Back to Top**](#test-guide)

</div>

 




|USB Interface Type|Connector Name|Results|
| :---: | :---: | :---: | 
|USB3.2|CN5/CN6|OK|
|USB3.2|CN20/CN21|N/A|
|USB2.0|CN13/CN15|OK|
|USB1.1|USB1|OK|


![All-USB-connectors-demo-1](./pics/All-USB-connectors-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

### USB3.2 (CN5, CN6) 



<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![USB32-CN5-CN6-demo-1](./pics/USB32-CN5-CN6-demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>

#### Before Inserting a USB Flash Drive

Before inserting a USB flash drive into the USB 3.2 ports, check the `/dev` directory:

```text
# ls
bin  dev  etc  home  lib  proc  root  sbin  scripts  tmp  usr  var
# cd dev
# ls -l umass*
ls: umass*: No such file or directory
#
```

> **NOTE:**
The system is booted from an NVMe SSD.


<div align="right">

[**Back to Top**](#test-guide)

</div>

#### After Inserting One USB Flash Drive

Insert one USB flash drive into a USB 3.2 port and check the `/dev` directory:

```console
#
# ls -l umass*
brw-------  1 root root 8,   0 2026-06-05 05:15 umass0
brw-------  1 root root 1,  14 2026-06-05 05:15 umass0t12
brw-------  1 root root 1,  13 2026-06-05 05:15 umass0t177
brw-------  1 root root 1,  15 2026-06-05 05:15 umass0t179
#
```

<div align="right">

[**Back to Top**](#test-guide)

</div>

#### After Inserting Two USB Flash Drives

Insert a second USB flash drive into another USB 3.2 port and check the `/dev` directory:


```text
#
# ls -l umass*
brw-------  1 root root 8,   0 2026-06-05 05:15 umass0
brw-------  1 root root 1,  14 2026-06-05 05:15 umass0t12
brw-------  1 root root 1,  13 2026-06-05 05:15 umass0t177
brw-------  1 root root 1,  15 2026-06-05 05:15 umass0t179
brw-------  1 root root 8,   1 2026-06-05 05:17 umass1
brw-------  1 root root 1,  16 2026-06-05 05:16 umass1.efi.0
brw-------  1 root root 1,  17 2026-06-05 05:16 umass1.qnx6.1
#
```


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### USB 3.2 Read Test

Perform a USB 3.2 read test using `fsync` with a USB 3.0 flash drive.

![USB32_reading_test](./pics/USB32_reading_test.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>



#### USB 3.2 Write Test



<div align="right">

[**Back to Top**](#test-guide)

</div>


Perform a USB 3.2 write test using `fsync` with a USB 3.0 flash drive.

![USB32_writing_test_with_fsync](./pics/USB32_writing_test_with_fsync.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB 3.2 (Internal Connectors: CN20, CN21) 




<div align="right">

[**Back to Top**](#test-guide)

</div>



Test cables are not available; therefore, these ports were not tested.


### USB 2.0 (Internal Connectors: CN13, CN15)




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



Use the same method to test the USB 2.0 ports.

<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB 1.1




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



Use the same method to test the USB 1.1 port.

<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## COM




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![COMX-list](./pics/COMX-list.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![COM-Headers-demo-2](./pics/COM-Headers-demo-2.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>



### COM1/COM2




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![CN1-COM1-COM2-demo-1](./pics/CN1-COM1-COM2-demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![COM1-connected-demo](./pics/COM1-connected-demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![COM2-connected-demo](./pics/COM2-connected-demo.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>



### COM3/COM4/COM5/COM6




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![COM-Headers-demo-1](./pics/COM-Headers-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![COM3-connected-demo](./pics/COM3-connected-demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![COM4-connected-demo](./pics/COM4-connected-demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![COM5-connected-demo](./pics/COM5-connected-demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


![COM6-connected-demo](./pics/COM6-connected-demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## SMBus




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![SMBus-CN12-demo-1](./pics/SMBus-CN12-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![SMBus-CN12-demo-2](./pics/SMBus-CN12-demo-2.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![SMBus-CN12-demo-3](./pics/SMBus-CN12-demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



### Reading Data from the MPU6050 




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![SMBus-CN12-demo-4](./pics/SMBus-CN12-demo-4.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Digital I/O Connector (CN7)




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![GPIO-CN7-demo-1](./pics/GPIO-CN7-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![GPIO-CN7-demo-2](./pics/GPIO-CN7-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



A shared library has been created to support the DI/DO configuration.

Two test applications, `imb540_dio_read_test` and `imb540_dio_write_test`, are provided as examples.


```console
# ls
bin  dev  etc  home  lib  proc  root  sbin  scripts  tmp  usr  var
# ls -al /usr/bin/imb540_dio*
-rwxrwxr-x  1 root root 8192 2026-06-01 16:06 /usr/bin/imb540_dio_read_test
-rwxrwxr-x  1 root root 8192 2026-06-01 16:06 /usr/bin/imb540_dio_write_test
#
```


### Input Test



<div align="right">

[**Back to Top**](#test-guide)

</div>

 



#### No Pins of DI are grounded


With no pins grounded, all digital inputs are pulled high:

![GPIO-CN7-input-no-pins-grounded](./pics/GPIO-CN7-input-no-pins-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

#### P 1 Grounded

Connect Pin 1 to Pin 10 (Pin 1 Grounded):

![GPIO-CN7-input-pin1-grounded](./pics/GPIO-CN7-input-pin1-grounded.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>




#### P 2 Grounded

Connect Pin 2 to Pin 10 (Pin 2 Grounded):

![GPIO-CN7-input-pin2-grounded](./pics/GPIO-CN7-input-pin2-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 3 Grounded

Connect Pin 3 to Pin 10 (Pin 3 Grounded):

![GPIO-CN7-input-pin3-grounded](./pics/GPIO-CN7-input-pin3-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 4 Grounded

Connect Pin 4 to Pin 10 (Pin 4 Grounded):

![GPIO-CN7-input-pin4-grounded](./pics/GPIO-CN7-input-pin4-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 5 Grounded

Connect Pin 5 to Pin 10 (Pin 5 Grounded):

![GPIO-CN7-input-pin5-grounded](./pics/GPIO-CN7-input-pin5-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 6 Grounded

Connect Pin 6 to Pin 10 (Pin 6 Grounded):

![GPIO-CN7-input-pin6-grounded](./pics/GPIO-CN7-input-pin6-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 7 Grounded

Connect Pin 7 to Pin 10 (Pin 7 Grounded):


![GPIO-CN7-input-pin7-grounded](./pics/GPIO-CN7-input-pin7-grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### P 8 Grounded

Connect Pin 8 to Pin 10 (Pin 8 Grounded):


![GPIO-CN7-input-pin8-grounded](./pics/GPIO-CN7-input-pin8-grounded.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



### Output Test



<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![GPIO-CN7-output-test](./pics/GPIO-CN7-output-test.png)


Use a multimeter to verify the output voltages on Pins 1-8.


<div align="right">

[**Back to Top**](#test-guide)

</div>



---


## Watchdog




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


The `WDTRST#` signal is generated by the `F81966` Super I/O controller.

A shared library, `libimb540_wdt.so`, has been created to support the watchdog timer.

The following example demonstrates how to use this library:

![watchdog_demo_1](./pics/watchdog_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---

## Hardware Monitor




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



A shared library, `libimb540_hw_mon.so`, has been created to support hardware monitoring.

The following example demonstrates how to use this library:

![HMonitor_demo_1](./pics/HMonitor_demo_1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## PCI Express Mini Card Connector (CN16)




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![CN16-PCIe-Minicard-demo-1](./pics/CN16-PCIe-Minicard-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![CN16-PCIe-Minicard-demo-2](./pics/CN16-PCIe-Minicard-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![PCIe-Minicard-interface-test-card](./pics/PCIe-Minicard-interface-test-card.png)


Insert the test card into the CN16 PCI Express Mini Card connector.

Use the following command to verify that the card is detected: 


![CN16-PCIe-Minicard-demo-3](./pics/CN16-PCIe-Minicard-demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## PCI Express/PCI Slots




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![PCI-PCIeX4_X16-demo-1](./pics/PCI-PCIeX4_X16-demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>



### PCI Express x4 Slots (PCIe2, PCIe3, PCIe5)




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![PCIex4-test-card](./pics/PCIex4-test-card.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Insert the test card into a PCI Express x4 slot.


![PCIex4-demo-1](./pics/PCIex4-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### PCI Express x16 Slots (PCIe1, PCIe4)




<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![PCIeX16_configuration](./pics/PCIeX16_configuration.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![PCIeX16-test-card](./pics/PCIeX16-test-card.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Insert the test card into a PCI Express x16 slot, then use `pci-tool -v` to verify that the card is detected.


![PCIeX16-demo-1](./pics/PCIeX16-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


### PCI Slots (PCI1, PCI2)





<div align="right">

[**Back to Top**](#test-guide)

</div>

 



![PCI-test-card](./pics/PCI-test-card.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


Before inserting the test card, use `pci-tool -v` to check the PCI device list:

```text
#
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/a705
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

.
.
.

B001:D00:F00 @ idx 20 in slot 21 of chassis 0
        vid/did: 104c/8240
                Texas Instruments, <device id - unknown>
        class/subclass/reg: 06/04/00
                PCI-to-PCI Bridge Device

B003:D00:F00 @ idx 22 in slot 22 of chassis 0
        vid/did: 8086/15f2
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller

B004:D00:F00 @ idx 23 in slot 23 of chassis 0
        vid/did: 8086/1533
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller

#
```

<div align="right">

[**Back to Top**](#test-guide)

</div>


After inserting the test card, use `pci-tool -v` again to verify that the PCI device is detected:

```text
#
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/a705
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

.
.
.

B001:D00:F00 @ idx 20 in slot 21 of chassis 0
        vid/did: 104c/8240
                Texas Instruments, <device id - unknown>
        class/subclass/reg: 06/04/00
                PCI-to-PCI Bridge Device

B002:D00:F00 @ idx 21 in slot 21 of chassis 0
        vid/did: 8086/107c
                Intel Corporation, 82541PI Gigabit Ethernet Controller (Copper) rev 5
        class/subclass/reg: 02/00/00
                Ethernet Network Controller


B003:D00:F00 @ idx 22 in slot 22 of chassis 0
        vid/did: 8086/15f2
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller

B004:D00:F00 @ idx 23 in slot 23 of chassis 0
        vid/did: 8086/1533
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/00/00
                Ethernet Network Controller

#
```
<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## Audio Jack




<div align="right">

[**Back to Top**](#test-guide)

</div>

 


![audio-CN4-demo-1](./pics/audio-CN4-demo-1.png)


Under QNX 8.0, the audio driver is not supported on Intel CPUs.


<div align="right">

[**Back to Top**](#test-guide)

</div>

---


[**Back to IMB540 BSP**](../README.md)
