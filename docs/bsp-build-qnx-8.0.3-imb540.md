[**Back to IMB540 BSP**](../README.md)

---

# IMB540

* [Set Up the Build Environment](#set-up-the-build-environment)
* [Download the Project](#download-the-project)
* [Build Commands](#build-commands)
* [Boot from a USB Flash Drive](#boot-from-a-usb-flash-drive)
    - [Disk Image](#disk-image)
    - [Use the `balenaEtcher` Tool](#use-the-balenaetcher-tool)

* [Boot from an NVme Card](#boot-from-an-nvme-card)


---


## Set Up the Build Environment



<div align="right">

[**Back to Top**](#imb540)

</div>
 


Source the QNX SDP environment script before building the BSP:

```console
$ source ~/qnx803/qnxsdp-env.sh
QNX_HOST=$HOME/qnx803/host/linux/x86_64
QNX_TARGET=$HOME/qnx803/target/qnx
MAKEFLAGS=-I$HOME/qnx803/target/qnx/usr/include
```

<div align="right">

[**Back to Top**](#imb540)

</div>
 

---

## Download the Project


<div align="right">

[**Back to Top**](#imb540)

</div>
 



Clone the repository and check out the **imb540** branch to retrieve the IMB540 BSP source:

```text
$ cd ~
$ git clone --branch imb540 --single-branch git@github.com:JasonL-GHub/qnx-industrial-pc-guide.git IMB540
```

The IMB540 BSP source files will be available at:

```text
~/IMB540/
```

<div align="right">

[**Back to Top**](#imb540)

</div>
 
 
 
---

## Build Commands


<div align="right">

[**Back to Top**](#imb540)

</div>
 


Change to the IMB540 BSP directory and build the project:

```console
$ cd ~/IMB540/
$ make clean
$ make
```



<div align="right">

[**Back to Top**](#imb540)

</div>
 

 
---


## Boot from a USB Flash Drive


<div align="right">

[**Back to Top**](#imb540)

</div>
 



### Disk Image


<div align="right">

[**Back to Top**](#imb540)

</div>
 




The build generates the following disk image:

|  Names      | Graphics | BIOS Legacy Boot | UEFI Boot |
| :------: |:-------:|:-------------:|:-------------:|
| disk_imb540-803.img  | **Yes** | **No** |**Yes** |



<div align="right">

[**Back to Top**](#imb540)

</div>
 
 
 

### Use the `balenaEtcher` Tool



<div align="right">

[**Back to Top**](#imb540)

</div>
 


Download and install the [`balenaEtcher`](https://etcher.balena.io/) tool.

Use `balenaEtcher` to write the QNX disk image to a USB flash drive.

![balenaEtcher-burner](./pics/balenaEtcher-burner.png)



<div align="right">

[**Back to Top**](#imb540)

</div>
 
 

---

## Boot from an NVme Card


<div align="right">

[**Back to Top**](#imb540)

</div>
 



After booting the system from the USB flash drive, use the `dd` command to copy the QNX image 
from the USB flash drive to the NVMe card. 

```console
# dd if=/dev/umass0 of=/dev/nvme0 count=1642496
1642496+0 records in
1642496+0 records out
840957952 bytes (802 M) copied, 27.491 s, 29 M/s
```
After the copy operation completes:

1. Power off the system.
2. Remove the USB flash drive.
3. Power on the IMB540.
4. The system should boot from the eMMC card.

> **Note:**

The image size is based on:

```text
512 bytes × 1,642,496 = 802 MiB
```



<div align="right">

[**Back to Top**](#imb540)

</div>
 
 
---

[**Back to IMB540 BSP**](../README.md)


