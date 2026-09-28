[**Back to CAPA322 BSP**](../README.md)

---

# CAPA322

* [Set Up the Build Environment](#set-up-the-build-environment)
* [Download the Project](#download-the-project)
* [Build Commands](#build-commands)
* [Boot from a USB Flash Drive](#boot-from-a-usb-flash-drive)
    - [Disk Image](#disk-image)
    - [Use the `balenaEtcher` Tool](#use-the-balenaetcher-tool)

* [Boot from a SATA Drive](#boot-from-a-sata-drive)


---


## Set Up the Build Environment



<div align="right">

[**Back to Top**](#capa322)

</div>
 



Source the QNX SDP environment script before building the BSP:

```console
$ source ~/qnx800/qnxsdp-env.sh
QNX_HOST=$HOME/qnx800/host/linux/x86_64
QNX_TARGET=$HOME/qnx800/target/qnx
MAKEFLAGS=-I$HOME/qnx800/target/qnx/usr/include
```

<div align="right">

[**Back to Top**](#capa322)

</div>
 

---

## Download the Project



<div align="right">

[**Back to Top**](#capa322)

</div>
 


Clone the repository and check out the **capa322** branch to retrieve the CAPA322 BSP source:

```text
$ cd ~
$ git clone --branch capa322 --single-branch git@github.com:JasonL-GHub/qnx-industrial-pc-guide.git CAPA322
```

The CAPA322 BSP source files will be available at:

```text
~/CAPA322/
```


<div align="right">

[**Back to Top**](#capa322)

</div>
 

 
---

## Build Commands



<div align="right">

[**Back to Top**](#capa322)

</div>
 


Change to the CAPA322 BSP directory and build the project:

```console
$ cd ~/CAPA322/
$ make clean
$ make
```


<div align="right">

[**Back to Top**](#capa322)

</div>
 
 
---


## Boot from a USB Flash Drive


<div align="right">

[**Back to Top**](#capa322)

</div>
 


### Disk Image


<div align="right">

[**Back to Top**](#capa322)

</div>
 


The build generates the following disk image:

|  Names      | Graphics | BIOS Legacy Boot | UEFI Boot |
|:------:|:-------:|:-------------:|:-------------:|
| disk_capa322-800.img  | **Yes** | **No** |**Yes** |




<div align="right">

[**Back to Top**](#capa322)

</div>
 

 

### Use the `balenaEtcher` Tool



<div align="right">

[**Back to Top**](#capa322)

</div>
 


Download and install the [`balenaEtcher`](https://etcher.balena.io/) tool.

Use `balenaEtcher` to write the QNX disk image to a USB flash drive.

![balenaEtcher-burner](./pics/balenaEtcher-burner.png)



<div align="right">

[**Back to Top**](#capa322)

</div>
 

---


## Boot from a SATA Drive


<div align="right">

[**Back to Top**](#capa322)

</div>
 


After booting the system from the USB flash drive, use the `dd` command to copy the QNX image 
from the USB flash drive to the SATA drive. 


```console
# dd if=/dev/umass0 of=/dev/sata0 count=1642496
1642496+0 records in
1642496+0 records out
840957952 bytes (802 M) copied, 27.491 s, 29 M/s
```
After the copy operation completes:

1. Power off the system.
2. Remove the USB flash drive.
3. Power on the CAPA322.
4. The system should boot from the SATA drive.

> **Note:**

The image size is based on:

```text
512 bytes × 1,642,496 = 802 MiB
```



<div align="right">

[**Back to Top**](#capa322)

</div>
 
 
---


[**Back to CAPA322 BSP**](../README.md)


