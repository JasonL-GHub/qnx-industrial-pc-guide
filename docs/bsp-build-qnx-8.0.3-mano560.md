[**Back to MANO560 BSP**](../README.md)

---

# MANO560

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

[**Back to Top**](#mano560)

</div>
 



```console
$ source ~/qnx803/qnxsdp-env.sh
QNX_HOST=$HOME/qnx803/host/linux/x86_64
QNX_TARGET=$HOME/qnx803/target/qnx
MAKEFLAGS=-I$HOME/qnx803/target/qnx/usr/include
```

<div align="right">

[**Back to Top**](#mano560)

</div>
 

---

## Download the Project


<div align="right">

[**Back to Top**](#mano560)

</div>
 



Clone the repository and check out the **mano566** branch to retrieve the MANO560 BSP source:

```text
$ cd ~
$ git clone --branch mano560 --single-branch git@github.com:JasonL-GHub/qnx-industrial-pc-guide.git MANO560 
```

The MANO560 BSP source files will be available at:

```text
~/MANO560/
```


<div align="right">

[**Back to Top**](#mano560)

</div>

 
---

## Build Commands


<div align="right">

[**Back to Top**](#mano560)

</div>
 



```console
$ cd ~/MANO560/
$ make clean
$ make 
```

<div align="right">

[**Back to Top**](#mano560)

</div>

---

## Boot from a USB Flash Drive


<div align="right">

[**Back to Top**](#mano560)

</div>
 



### Disk Image


<div align="right">

[**Back to Top**](#mano560)

</div>
 




|  Names      | Graphics | BIOS Legacy Boot | UEFI Boot |
| :------: |:-------:|:-------------:|:-------------:|
| disk_mano560-803.img  | **Yes** | **No** |**Yes** |


<div align="right">

[**Back to Top**](#mano560)

</div>

 


### Use the `balenaEtcher` Tool



<div align="right">

[**Back to Top**](#mano560)

</div>
 


Download [balenaEtcher](https://etcher.balena.io/) and install it. 

![balenaEtcher-burner](./pics/balenaEtcher-burner.png)


<div align="right">

[**Back to Top**](#mano560)

</div>



---

## Boot from a SATA Drive



<div align="right">

[**Back to Top**](#mano560)

</div>
 


After system booting from the USB memory stick, use `dd` command to copy image from the USB memory device onto the SATA Disk: 

```console
# dd if=/dev/umass0 of=/dev/sata0 count=1642496
1642496+0 records in
1642496+0 records out
840957952 bytes (802 M) copied, 27.491 s, 29 M/s
```
After the copy operation completes:

1. Power off the system.
2. Remove the USB flash drive.
3. Power on the MANO560.
4. The system should boot from the SATA disk.

> **Note:**

The image size is based on:

```text
512 bytes × 1,642,496 = 802 MiB
```



<div align="right">

[**Back to Top**](#mano560)

</div>

 
---

[**Back to MANO560 BSP**](../README.md)


