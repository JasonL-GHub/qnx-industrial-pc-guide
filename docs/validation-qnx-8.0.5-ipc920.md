[**Back to IPC920 BSP**](../README.md)


---


# Test Guide

This guide describes the basic functional tests performed on the Axiomtek IPC920 platform running QNX 8.0.5.

* [Basic Function Test Items](#basic-function-test-items)
    - [Storage](#storage)
    - [Display](#display)
    - [Ethernet](#ethernet)
    - [USB](#usb)
    - [COM](#com)
    - [SMBus](#smbus)
    - [Digital I/O Connector](#digital-io-connector)
        - [Input Test](#input-test)
        - [Output Test](#output-test)
    - [Watchdog](#watchdog)
    - [Programmable LEDs](#programmable-leds)
    - [Hardware Monitor](#hardware-monitor)
    - [M.2 Key M Connector (SCN1)](#m2-key-m-connector-scn1)
    - [M.2 Key E Connector (SCN7)](#m2-key-e-connector-scn7)
    - [Mini Card Connector (SCN8)](#mini-card-connector-scn8)

> **NOTE**:

**Test platform:** IPC920 (PCB526 VER: A2-RC) with Intel Core i7-14700T processor.



---


# Basic Function Test Items


---


## Storage

<div align="right">

[**Back to Top**](#test-guide)

</div>


#### SATA

<div align="right">

[**Back to Top**](#test-guide)

</div>


![storage_sata_demo_1](./pics/storage_sata_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### NVMe


<div align="right">

[**Back to Top**](#test-guide)

</div>

![storage_scn1_nvme_demo_1](./pics/storage_scn1_nvme_demo_1.png)

<div align="right">

[**Back to Top**](#test-guide)

</div>



---



## Display

<div align="right">

[**Back to Top**](#test-guide)

</div>


|Display Interface|DisplayName shown in QNX8.0|Intel I7-14700T |
| :---: | :---: | :---: | 
|HDMI|display 1|OK|
|DisplayPort++|display 3|OK|

![IPC920_display_demo](./pics/IPC920_display_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



Start the QNX graphics system using:

```console
# /scripts/start-graphics.sh
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



The IPC920 provides three Ethernet ports: **LAN1, LAN2, and LAN3**.


![IPC920_LAN1_LAN2_LAN3_demo](./pics/IPC920_LAN1_LAN2_LAN3_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN1-ifconfig-demo-1](./pics/LAN1-ifconfig-demo-1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN2-ifconfig-demo-1](./pics/LAN2-ifconfig-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN3-ifconfig-demo-1](./pics/LAN3-ifconfig-demo-1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### Network Throughput Test

<div align="right">

[**Back to Top**](#test-guide)

</div>


Use `iperf3` to test network throughput. In this example, the IPC920 operates as the client and a Linux test machine operates as the server.

#### LAN1

<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN1-throughput-test-server](./pics/LAN1-throughput-test-server.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN1-throughput-test-client](./pics/LAN1-throughput-test-client.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


#### LAN2


<div align="right">

[**Back to Top**](#test-guide)

</div>


![LAN2-throughput-test-server](./pics/LAN2-throughput-test-server.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![LAN2-throughput-test-client](./pics/LAN2-throughput-test-client.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## USB

<div align="right">

[**Back to Top**](#test-guide)

</div>


|USB Interface Type|Connector Name|
| --- | --- | 
|USB3.2|CN11, CN17|
|USB2.0|Internal USB2.0 Type A Connecor|



![USB32_ports_demo](./pics/USB32_ports_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![IPC920_internal_usb2.0_typeA_connector_demo](./pics/IPC920_internal_usb2.0_typeA_connector_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![USB32_test_demo_1](./pics/USB32_test_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB 3.2 Read Test

<div align="right">

[**Back to Top**](#test-guide)

</div>


A USB 3.0 flash drive was used to test USB 3.2 read performance with `fsync`:

![usb32_read_test_demo](./pics/usb32_read_test_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### USB 3.2 Write Test

<div align="right">

[**Back to Top**](#test-guide)

</div>



A USB 3.0 flash drive was used to test USB 3.2 write performance with `fsync`:

![usb32_write_test_demo](./pics/usb32_write_test_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## COM


<div align="right">

[**Back to Top**](#test-guide)

</div>


![IPC920_COMx_demo](./pics/IPC920_COMx_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


### COM1/COM2



<div align="right">

[**Back to Top**](#test-guide)

</div>




#### COM1



<div align="right">

[**Back to Top**](#test-guide)

</div>




![COM1_demo_1](./pics/COM1_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### COM2



<div align="right">

[**Back to Top**](#test-guide)

</div>





![COM2_demo_1](./pics/COM2_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## SMBus



<div align="right">

[**Back to Top**](#test-guide)

</div>




![smbus_demo](./pics/smbus_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## Digital I/O Connector



<div align="right">

[**Back to Top**](#test-guide)

</div>




![IPC920_DIO_demo](./pics/IPC920_DIO_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![IPC920_DIO_demo_CN4](./pics/IPC920_DIO_demo_CN4.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


![IPC920_DIO_demo_CN5](./pics/IPC920_DIO_demo_CN5.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



A shared library has been developed to support the DI/DO configuration.

Two test applications are provided:

- `ipc920_dio_read_test`
- `ipc920_dio_write_test`


### Input Test 



<div align="right">

[**Back to Top**](#test-guide)

</div>



```console
# ls
bin  etc   lib   root  scripts  tmp  var
dev  home  proc  sbin  sys      usr
# ls -al /usr/bin/ipc920_dio*
-rwxr-xr-x  1 root root 8192 2025-12-17 01:27 /usr/bin/ipc920_dio_read_test
-rwxr-xr-x  1 root root 8192 2025-12-17 01:28 /usr/bin/ipc920_dio_write_test
#
```

#### No DI Pins Grounded

![IPC920_input_test_CN5_no_pins_grounded](./pics/IPC920_input_test_CN5_no_pins_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>

#### Pin 1 Grounded

Connect Pin 1 to Pin 9 (Pin 1 grounded):


![IPC920_input_test_CN5_pin1_grounded](./pics/IPC920_input_test_CN5_pin1_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 2 Grounded

Connect Pin 2 to Pin 9 (Pin 2 grounded):

![IPC920_input_test_CN5_pin2_grounded](./pics/IPC920_input_test_CN5_pin2_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 3 Grounded

Connect Pin 3 to Pin 9 (Pin 3 grounded):


![IPC920_input_test_CN5_pin3_grounded](./pics/IPC920_input_test_CN5_pin3_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 4 Grounded

Connect Pin 4 to Pin 9 (Pin 4 grounded):


![IPC920_input_test_CN5_pin4_grounded](./pics/IPC920_input_test_CN5_pin4_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 5 Grounded

Connect Pin 5 to Pin 9 (Pin 5 grounded):

![IPC920_input_test_CN5_pin5_grounded](./pics/IPC920_input_test_CN5_pin5_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


#### Pin 6 Grounded

Connect Pin 6 to Pin 9 (Pin 6 grounded):


![IPC920_input_test_CN5_pin6_grounded](./pics/IPC920_input_test_CN5_pin6_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### Pin 7 Grounded

Connect Pin 7 to Pin 9 (Pin 7 grounded):

![IPC920_input_test_CN5_pin7_grounded](./pics/IPC920_input_test_CN5_pin7_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



#### Pin 8 Grounded

Connect Pin 8 to Pin 9 (Pin 8 grounded):


![IPC920_input_test_CN5_pin8_grounded](./pics/IPC920_input_test_CN5_pin8_grounded.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>





### Output Test




<div align="right">

[**Back to Top**](#test-guide)

</div>




![IPC920_output_test_CN4_pins_demo](./pics/IPC920_output_test_CN4_pins_demo.png)

Use a multimeter to test the output of Pins 1 through 8.


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## Watchdog



<div align="right">

[**Back to Top**](#test-guide)

</div>




The `WDTRST#` signal is provided by the `F81966` Super I/O controller.

A shared library, `libipc920_wdt.so`, has been developed to support the watchdog function.

The following image shows an example of using this library:

![IPC920_watchdog_demo](./pics/IPC920_watchdog_demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## Programmable LEDs



<div align="right">

[**Back to Top**](#test-guide)

</div>




A shared library, `libipc920_pl.so`, has been developed to control the programmable LEDs.

The following example turns **LED1, LED2, and LED3 ON for 5 seconds**, and then turns all three LEDs **OFF**:
 

![IPC920_3_userdefined_leds_demo_1](./pics/IPC920_3_userdefined_leds_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![IPC920_3_userdefined_leds_demo_2](./pics/IPC920_3_userdefined_leds_demo_2.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## Hardware Monitor



<div align="right">

[**Back to Top**](#test-guide)

</div>





A shared library, `libipc920_hw_mon.so`, has been developed to provide hardware monitoring functionality.

The following images show an example of using this library:


![ipc920_bios_hw_mon_demo](./pics/ipc920_bios_hw_mon_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



![ipc920_hw_mon_test](./pics/ipc920_hw_mon_test.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## M.2 Key M Connector (SCN1)



<div align="right">

[**Back to Top**](#test-guide)

</div>




![scn1_demo](./pics/scn1_demo.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


After installing the **Transcend TS128GMTE452T2** NVMe storage module, use `pci-tool -v` to verify that the device is detected:


![storage_scn1_nvme_demo_1](./pics/storage_scn1_nvme_demo_1.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---


## M.2 Key E Connector (SCN7)




<div align="right">

[**Back to Top**](#test-guide)

</div>





![scn7_demo_1](./pics/scn7_demo_1.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>

After inserting the test card, use `pci-tool` to verify the device:


![scn7_test_card](./pics/scn7_test_card.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


After inserting the test card, use `pci-tool` to verify the device:

![scn7_pci_tool_output_with_test_card](./pics/scn7_pci_tool_output_with_test_card.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>


---



## Mini Card Connector (SCN8)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![PCIe-Minicard-interface-demo](./pics/PCIe-Minicard-interface-demo.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>



![PCIe-Minicard-interface-test-card](./pics/PCIe-Minicard-interface-test-card.png)


<div align="right">

[**Back to Top**](#test-guide)

</div>



After inserting the test card, use `pci-tool` to verify the device:

![pci-tool-output-with-pcie-minicard](./pics/pci-tool-output-with-pcie-minicard.png)



<div align="right">

[**Back to Top**](#test-guide)

</div>


---


[**Back to IPC920 BSP**](../README.md)

