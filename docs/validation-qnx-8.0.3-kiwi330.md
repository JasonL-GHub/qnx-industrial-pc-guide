[**Back to KIWI330 BSP**](../README.md)


---


# Test Guide

This guide describes the basic functional tests performed on the Axiomtek KIWI330 platform running QNX 8.0.3

* [Basic Function Test Items](#basic-function-test-items)
    - [Storage](#storage)
       - [NVMe](#nvme) 
    - [Display](#display)
    - [Ethernet](#ethernet)
    - [USB](#usb)
      - [USB2.0 on MIO331](#usb20-on-mio331) 
      - [USB2.0 on KIWI330](#usb20-on-kiwi330) 
      - [USB3.2 on KIWI330](#usb32-on-kiwi330) 
    - [COM](#com)
    - [SMBus](#smbus)
    - [Digital I/O Connector](#digital-io-connector)
      - [Input Test](#input-test) 
      - [Output Test](#output-test) 
    - [Watchdog](#watchdog)
    - [Hardware Monitor](#hardware-monitor)
    - [M.2 Key E Connector (CN4)](#m2-key-e-connector-cn4)
    

> **Note:**
> 
> Test platform:  KIWI330-N50-S (P/N-E3D0330100)equipped with an Intel® Processor N50, 4 GB 
> LPDDR5 memory, and a 64 GB NVMe SSD with cooler.  
> 
> **MIO Expansion Modules**: MIO331 and MIO334




---


# Basic Function Test Items


<div align="right">

[**Back to Top**](#test-guide)

</div>


## Storage

<div align="right">

[**Back to Top**](#test-guide)

</div>


### NVMe


<div align="right">

[**Back to Top**](#test-guide)

</div>


Install an NVMe card, then check the `/dev` directory:


![storage-NVMe-demo](./pics/storage-NVMe-demo.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


Use `pci-tool -v` to verify that the NVMe controller is detected:

```text
# pci-tool -v
Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/4614
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

B000:D02:F00 @ idx 1
        vid/did: 8086/46d2
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 03/00/00
                PC Compatible VGA Display Controller

B000:D10:F00 @ idx 2
        vid/did: 8086/467d
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 11/80/00
                Other DA/DSP Controller
.
.
.

B001:D00:F00 @ idx 15 in slot 12 of chassis 0
        vid/did: 1987/5013
                <vendor id - unknown>, <device id - unknown>
        class/subclass/reg: 01/08/02
                Non-volatile Memory Subsystem (NVMe Interface IO Controller)
```

<div align="right">

[**Back to Top**](#test-guide)

</div>


## Display


<div align="right">

[**Back to Top**](#test-guide)

</div>



|Connector Name|Display Interface|Intel® processor N50|
| :---: | :---: | :---: | 
|CN1|eDP|N/A|
|CN8|Type C, ALT Mode, DisplayPort|OK|

![KIWI330_CN1_eDP_1](./pics/KIWI330_CN1_eDP_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

![KIWI330_CN1_eDP_2](./pics/KIWI330_CN1_eDP_2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

![KIWI330_CN8_ALT_TypeC_demo-1](./pics/KIWI330_CN8_ALT_TypeC_demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN8_ALT_TypeC_demo-2](./pics/KIWI330_CN8_ALT_TypeC_demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


Run the following commands to start the demo app: 

```console
# /scripts/start-graphics.sh
Starting screen
# /usr/bin/gles2-maze
```

![display-graphics](./pics/display-graphics.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


## USB


<div align="right">

[**Back to Top**](#test-guide)

</div>



|USB Interface|USB Type|Connector Name|Board Name|
| :---: | :---: | :---: | :---: | 
|USB2.0|USB Type A|CN1/CN2/CN5/CN6|MIO331|
|USB2.0|N/A|CN10|KIWI330|
|USB3.2|USB Type C|CN5, CN9|KIWI330|



### USB2.0 on MIO331


<div align="right">

[**Back to Top**](#test-guide)

</div>



![MIO331-USB2.0-connectors-demo](./pics/MIO331-USB2.0-connectors-demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO331-usb2.0-demo-1](./pics/MIO331-usb2.0-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO331-usb2.0-reading-test](./pics/MIO331-usb2.0-reading-test.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO331-usb2.0-writing-test-with-fsync](./pics/MIO331-usb2.0-writing-test-with-fsync.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB2.0 on KIWI330


<div align="right">

[**Back to Top**](#test-guide)

</div>



![KIWI330_CN10_USB2.0_demo-1](./pics/KIWI330_CN10_USB2.0_demo-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN10_USB2.0_demo-2](./pics/KIWI330_CN10_USB2.0_demo-2.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN10_USB2.0_demo-3](./pics/KIWI330_CN10_USB2.0_demo-3.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB3.2 on KIWI330


<div align="right">

[**Back to Top**](#test-guide)

</div>



![KIWI330_CN5_Vertical_Type_C-1](./pics/KIWI330_CN5_Vertical_Type_C-1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>

![KIWI330_CN5_Vertical_Type_C-2](./pics/KIWI330_CN5_Vertical_Type_C-2.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN9_USB3.2_demo-1](./pics/KIWI330_CN9_USB3.2_demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN9_USB3.2_demo-2](./pics/KIWI330_CN9_USB3.2_demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN9_USB3.2_demo-3](./pics/KIWI330_CN9_USB3.2_demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN9_USB3.2_demo-4](./pics/KIWI330_CN9_USB3.2_demo-4.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---

## COM


<div align="right">

[**Back to Top**](#test-guide)

</div>



**Required Test Equipment**: One MIO334 module.


![MIO334-COMx-demo-1](./pics/MIO334-COMx-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO334-COMx-demo-2](./pics/MIO334-COMx-demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO334-COMx-demo-3](./pics/MIO334-COMx-demo-3.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO334-COMx-demo-4](./pics/MIO334-COMx-demo-4.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## Ethernet


<div align="right">

[**Back to Top**](#test-guide)

</div>



**Required Test Equipment**: One MIO331 module.

![MIO331-demo-1](./pics/MIO331-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO331-LAN-ifconfig-1](./pics/MIO331-LAN-ifconfig-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

### Throughput Test


Use `iperf3` to measure network throughput. In this example, the **KIWI330** operates as the client, while the **Linux test machine** operates as the server.


![MIO331-LAN-throughput-test-client-side](./pics/MIO331-LAN-throughput-test-client-side.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![MIO331-LAN-throughput-test-server-side](./pics/MIO331-LAN-throughput-test-server-side.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## SMBus


<div align="right">

[**Back to Top**](#test-guide)

</div>



![SMBus-demo](./pics/SMBus-demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---

## Digital I/O Connector


<div align="right">

[**Back to Top**](#test-guide)

</div>



![KIWI330_CN6_DIO_demo-1](./pics/KIWI330_CN6_DIO_demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN6_DIO_demo-2](./pics/KIWI330_CN6_DIO_demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


A shared library has been created to support the DI/DO configuration.

Two test example files are provided:

- `kiwi330_dio_read_test`
- `kiwi330_dio_write_test`


```console
#
# find ./ -name kiwi330_dio*
./usr/bin/kiwi330_dio_read_test
./usr/bin/kiwi330_dio_write_test
#
```

### Input Test


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### No Pins Pulled-up

None of DI pins are pulled-up:

![DIO-Reading-Test-No-Pins-Vcced](./pics/DIO-Reading-Test-No-Pins-Vcced.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 1 Pulled-up

Connect **Pin 1** to **Pin 9** to pull up Pin 1:

![DIO-Reading-Test-Pin1-Vcced-only](./pics/DIO-Reading-Test-Pin1-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 2 Pulled-up

Connect **Pin 2** to **Pin 9** to pull up Pin 2:


![DIO-Reading-Test-Pin2-Vcced-only](./pics/DIO-Reading-Test-Pin2-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 3 Pulled-up

Connect **Pin 3** to **Pin 9** to pull up Pin 3:


![DIO-Reading-Test-Pin3-Vcced-only](./pics/DIO-Reading-Test-Pin3-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 4 Pulled-up

Connect **Pin 4** to **Pin 9** to pull up Pin 4:


![DIO-Reading-Test-Pin4-Vcced-only](./pics/DIO-Reading-Test-Pin4-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 5 Pulled-up

Connect **Pin 5** to **Pin 9** to pull up Pin 5:


![DIO-Reading-Test-Pin5-Vcced-only](./pics/DIO-Reading-Test-Pin5-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 6 Pulled-up

Connect **Pin 6** to **Pin 9** to pull up Pin 6:


![DIO-Reading-Test-Pin6-Vcced-only](./pics/DIO-Reading-Test-Pin6-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 7 Pulled-up

Connect **Pin 7** to **Pin 9** to pull up Pin 7:


![DIO-Reading-Test-Pin7-Vcced-only](./pics/DIO-Reading-Test-Pin7-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 8 Pulled-up

Connect **Pin 8** to **Pin 9** to pull up Pin 8:


![DIO-Reading-Test-Pin8-Vcced-only](./pics/DIO-Reading-Test-Pin8-Vcced-only.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### Output Test


<div align="right">

[**Back to Top**](#test-guide)

</div>



![DIO-writing-test-results](./pics/DIO-writing-test-results.png)

One multimeter can be used to verify the output results. 


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## Watchdog


<div align="right">

[**Back to Top**](#test-guide)

</div>



The `WDT_INT#` signal is generated by the I2C-controlled `PCF85063A`.

A shared library, `libkiwi330_wdt.so`, has been created to support the watchdog timer.

The following example demonstrates how to use this library:

```console
#
# pwd
/
# find ./ -name kiwi330_wdt*
./usr/bin/kiwi330_wdt_refresh
./usr/bin/kiwi330_wdt_start
./usr/bin/kiwi330_wdt_stop
#
```

![kiwi330_watchdog_demo.png](./pics/kiwi330_watchdog_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## Hardware Monitor


<div align="right">

[**Back to Top**](#test-guide)

</div>



A shared library, `libwiki330_hw_mon.so`, has been created to support hardware monitoring.

The following example demonstrates how to use this library:

![KIWI330_hardware_monitor_demo_1](./pics/KIWI330_hardware_monitor_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_hardware_monitor_demo_2](./pics/KIWI330_hardware_monitor_demo_2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

---

## M.2 Key E Connector (CN4)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![KIWI330_CN4_M2_E_demo-1](./pics/KIWI330_CN4_M2_E_demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![KIWI330_CN4_M2_E_demo-2](./pics/KIWI330_CN4_M2_E_demo-2.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


After inserting the **Intel® 9260NGW Wi-Fi module**, use `pci-tool -v` to verify that the module is detected:


```console
# pci-tool -v

Partition: pci

Managing Server ID: 1, pid: 20487, running
B000:D00:F00 @ idx 0
        vid/did: 8086/4614
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 06/00/00
                Host-to-PCI Bridge Device

B000:D02:F00 @ idx 1
        vid/did: 8086/46d2
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 03/00/00
                PC Compatible VGA Display Controller

B000:D10:F00 @ idx 2
        vid/did: 8086/467d
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 11/80/00
                Other DA/DSP Controller

B000:D13:F00 @ idx 3
        vid/did: 8086/464e
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 0c/03/30
                USB Serial Bus Controller (Intel eXtensible HCI)

B000:D20:F00 @ idx 4
        vid/did: 8086/54ed
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 0c/03/30
                USB Serial Bus Controller (Intel eXtensible HCI)
.
.
.
B001:D00:F00 @ idx 16 in slot 12 of chassis 0
        vid/did: 1987/5013
                <vendor id - unknown>, <device id - unknown>
        class/subclass/reg: 01/08/02
                Non-volatile Memory Subsystem (NVMe Interface IO Controller)

B002:D00:F00 @ idx 17 in slot 14 of chassis 0     // Intel Wi-Fi Controller:  Device ID: 2526
        vid/did: 8086/2526	
                Intel Corporation, <device id - unknown>
        class/subclass/reg: 02/80/00
                Other Network Controller
#
```




<div align="right">

[**Back to Top**](#test-guide)

</div>

---

[**Back to KIWI330 BSP**](../README.md)
