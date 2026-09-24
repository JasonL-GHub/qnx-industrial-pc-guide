# QNX on Axiomtek Industrial PCs

## Table of Contents

### Getting Started

- [Deploying QNX on Axiomtek Industrial PCs](#deploying-qnx-on-axiomtek-industrial-pcs) 
- [The Challenge of Deploying QNX on Industrial Hardware](#the-challenge-of-deploying-qnx-on-industrial-hardware) 
- [Supported Axiomtek Platforms](#supported-axiomtek-platforms)
- [Repository Structure](#repository-structure)
- [Understanding QNX Deployment & Licensing](#understanding-qnx-deployment--licensing-prerequisites)

### Build & Validate

- [Step-by-Step Guide: From BSP Source Code to Hardware Validation](#step-by-step-guide-from-bsp-source-code-to-hardware-validation)
- [Ensuring Reliability: Hardware & I/O Validation](#ensuring-reliability-hardware--io-validation)

### Customization & Support

- [Scaling Up: Product Line & Customization Support](#scaling-up-product-line--customization-support)
- [Next Steps](#next-steps)

### Legal

- [License](#license)


---

## Deploying QNX on Axiomtek Industrial PCs

---

### A Practical Guide from BSP to Hardware Validation

This guide provides engineers with practical guidance for deploying 
**QNX® Software Systems** on **Axiomtek industrial computing platforms**.

The goal is to reduce the time and effort required to bring up **QNX** on 
**Axiomtek platforms**, enabling developers to focus on **real-time applications, 
industrial automation, edge computing, and other application development**.


> **Build it. Boot it. Validate it. Develop on it.**



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




---

## The Challenge of Deploying QNX on Industrial Hardware

QNX is increasingly used in **mission-critical industrial automation, edge AI, robotics, 
and real-time systems**, where reliability, deterministic performance, and long-term 
stability are essential.

However, deploying QNX on off-the-shelf industrial PCs can present challenges that 
engineers may not encounter with standard Linux systems:

- **Driver compatibility** - Newer Ethernet, USB, graphics, and chipset devices may 
    not have a suitable QNX driver.
- **Board bring-up** - BIOS/UEFI configuration, PCIe devices, interrupts, GPIO, serial 
    ports, and other hardware may require platform-specific configuration.
- **BSP availability** - A suitable BSP may not exist for every CPU or motherboard, 
    increasing development and validation time.
- **Hardware revisions** - Changes to chipsets, memory, controllers, or peripherals 
    can require BSP or driver updates.
- **Licensing & evaluation** - Setting up the QNX development environment and 
    understanding licensing and evaluation options can add complexity for engineers 
    new to QNX.

> **The result:** A platform that works out-of-the-box under Linux may still require 
  significant engineering effort to become fully functional and production-ready under 
  QNX.



### Why QNX-Ready Industrial Platforms Matter

Validated **QNX BSPs for industrial PCs** can significantly reduce hardware bring-up 
time and provide engineers with a practical starting point for QNX-based development.

This project provides practical guidance, BSP resources, and deployment information 
to help engineers **evaluate, bring up, and deploy QNX on Axiomtek industrial 
computing platforms**.


<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>


---


## Supported Axiomtek Platforms

This project provides **QNX BSP source code, build and deployment instructions, and 
hardware validation guidance** for selected Axiomtek industrial computing platforms.

Each supported platform is maintained in its own **Git branch**, containing the BSP source code and 
platform-specific documentation.

The following table summarizes the platforms and QNX SDP versions currently available in this 
repository.


| Platform | QNX SDP Version | Product Branch | Status |
|:---:|:---:|:---:|:---:|
| **IPC920** | 8.0.5 | `ipc920` | Available |
| **MANO566** | 8.0.5 | `mano566` | Available |
| **MANO560** | 8.0.3 | `mano560` | Available |
| **ICO330** | 8.0.3 | `ico330` | Available |




<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### What This Repository Provides

Depending on the platform and QNX version, the product branch may include::

- BSP source code and build configuration
- BSP build and deployment instructions
- Hardware and peripheral validation information
- Known limitations and workarounds
- Hardware-specific troubleshooting and debugging guidance

Each product branch keeps the **BSP source code** and **platform-specific documentation** together, 
making the branch a self-contained resource for the corresponding Axiomtek platform.




<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### Axiomtek QNX-Supported Products

The platforms documented in this repository are part of Axiomtek's broader portfolio of products with 
QNX BSP support. Axiomtek maintains a dedicated QNX page that provides information about 
additional QNX-supported boards, modules, embedded systems, and industrial platforms.

For the latest information about Axiomtek's QNX-supported products, visit the official 
[**Axiomtek QNX Solutions - Real-Time OS**](https://www.axiomtek.com/resources/case-studies/real-time-os-with-qnx) page.

This repository focuses on providing practical engineering resources for the platforms covered here. 
The Axiomtek QNX page provides the broader reference for Axiomtek's QNX-supported product portfolio.




<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### Platform and BSP Considerations

QNX support can vary depending on the **platform configuration, CPU generation, 
PCB revision, BIOS/UEFI version, QNX release, and connected peripherals**. Always 
verify the target hardware configuration before deploying a BSP.

A BSP listed in this repository provides a starting point for bringing up QNX on the 
corresponding Axiomtek platform. Additional configuration or platform-specific 
customization may be required for different hardware revisions or configurations.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### Platform Status

- **Available** - BSP source and related information are available and have been 
  evaluated on the target platform.
- **Development** - BSP support or hardware validation is currently in progress.
- **TBD** - Information or support for the specified item has not yet been finalized.

The goal of this project is to make QNX deployment on Axiomtek industrial platforms 
**faster, more predictable, and easier for engineers to evaluate, develop, and validate**.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---

## Repository Structure

The repository is organized by **Axiomtek product branches**. Each product branch contains 
the QNX BSP source code and engineering documentation for the corresponding platform.

```text
qnx-industrial-pc-guide/
|
+-- main
|   +-- README.md
|   +-- LICENSE.md
|
+-- ipc920
|   +-- README.md
|   +-- LICENSE.md
|   +-- src/
|   +-- prebuilt/
|   +-- install/
|   +-- images/
|   +-- binary_files_with_symbols/
|   +-- Makefile
|   +-- manifest
|   +-- source.xml
|   +-- docs/
|       +-- bsp-build-qnx-8.0.5-ipc920.md
|       +-- validation-qnx-8.0.5-ipc920.md
|
+-- mano566
|   +-- README.md
|   +-- LICENSE.md
|   +-- ...
|
+-- mano560
|   +-- README.md
|   +-- LICENSE.md
|   +-- ...
|
+-- ico330
    +-- README.md
    +-- LICENSE.md
    +-- ...
```

> **Note**: **ipc920**, **mano566**, **mano560**, and **ico330** are Git branches, not directories within the main branch.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>





### Product Branches

Each product branch contains the QNX BSP source code, build files, and engineering documentation specific to that Axiomtek platform.


| Product | QNX SDP Version | Branch |
|:---:|:---:|:---:|
| **IPC920** | 8.0.5 | `ipc920` |
| **MANO566** | 8.0.5 | `mano566` |
| **MANO560** | 8.0.3 | `mano560` |
| **ICO330** | 8.0.3 | `ico330` |


### Documentation

Each product branch contains a `docs/` directory with platform-specific engineering documentation, including:

- **BSP Build Guide** - BSP setup, source download, build, and deployment instructions.
- **Validation Guide** - Hardware and functional test procedures for the platform.


This structure keeps the **BSP source code** and **engineering documentation** organized within 
each product branch, while allowing each product to be maintained independently.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---


## Understanding QNX Deployment & Licensing (Prerequisites)

Before building or deploying a QNX BSP, it is important to understand the distinction 
between the **Axiomtek BSP source code** and the **QNX Software Development 
Platform (SDP)**.

### Why QNX Bootable Images Are Not Publicly Distributed

QNX SDP and the QNX operating system are provided under QNX licensing terms. 
Therefore, this project does **not publicly distribute pre-installed QNX operating 
system images or other QNX-licensed binaries**.

Instead, this project provides the **Axiomtek-specific BSP source code, 
configuration, build instructions, and technical guidance** needed to build QNX 
for supported Axiomtek platforms.

### QNX SDP Evaluation

The BSP source code in this repository is intended to be used with the appropriate
**QNX Software Development Platform (SDP)**.

For evaluation and development, QNX provides a **30-day evaluation
of QNX SDP 8.0**:

[**QNX SDP 8.0 30-day evaluation**](https://www.qnx.com/products/evaluation/)



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>





### Recommended Evaluation Approach

Engineers who want to evaluate QNX on an Axiomtek platform can use the **QNX 30-day
evaluation SDP** together with the Axiomtek BSP source provided in this repository.

The general workflow is:

1. **Obtain the QNX 30-day evaluation SDP** from QNX.

2. **Install and configure the QNX development environment** according to the QNX 
   documentation.

3. **Download the appropriate Axiomtek BSP source** from this repository.

4. **Build the BSP** using the QNX SDP environment.

5. **Create a bootable QNX image** for the target Axiomtek platform.

6. **Boot and evaluate QNX** on the target hardware.

7. For continued development or production deployment, **obtain the appropriate 
   QNX commercial license** from QNX.

This approach allows engineers to evaluate QNX and Axiomtek hardware while 
keeping the QNX software and licensed components within the applicable 
QNX licensing framework.

> **Important:** This repository provides Axiomtek BSP-related source code and 
  technical information. It does not replace the QNX SDP, QNX documentation, or 
  QNX licensing terms. Please refer to the applicable QNX license agreement for the
  permitted use and distribution of QNX software.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---


## Step-by-Step Guide: From BSP Source Code to Hardware Validation

The repository provides a structured workflow for bringing up and validating QNX on **Axiomtek industrial platforms**.


The process is organized into the following stages:

 1. **Select the Axiomtek platform**

    Choose the appropriate Axiomtek product branch, such as **ipc920**, **mano566**, **mano560**, or **ico330**.

 2. **Select the QNX SDP version**

    Verify that the product branch supports the required QNX SDP version for the target platform.
     
 3. **Obtain the BSP source code**

    Clone or check out the corresponding product branch to obtain the platform-specific BSP source code and related files.

 4. **Build the BSP**

    Follow the platform-specific BSP Build Guide in the product branch. The guide provides the 
    required environment setup, source code preparation, build commands, and boot image 
    generation procedure.


 5. **Deploy the boot image**

    Write the generated QNX boot image to a USB flash drive or other supported storage device, 
    then boot the target platform from the device.

 6. **Validate the hardware**

     Follow the corresponding Validation Guide to test storage, display, Ethernet, USB, serial ports, 
     GPIO, watchdog, and other platform-specific interfaces.

 7. **Develop and deploy applications**

    Once the BSP and hardware are validated, use the QNX environment to develop and deploy applications 
    on the target platform.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>





### Product Branches

- [**ipc920**](../../tree/ipc920) - QNX SDP 8.0.5
- [**mano566**](../../tree/mano566) - QNX SDP 8.0.5
- [**mano560**](../../tree/mano560) - QNX SDP 8.0.3
- [**ico330**](../../tree/ico330) - QNX SDP 8.0.3




> **Important:** The exact build and deployment procedure is platform-specific. Always 
  follow the BSP documentation for the target Axiomtek model and QNX SDP version.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>



### Platform-Specific Guides

Detailed build and validation procedures are maintained separately for each 
supported product branch.


For example:


```text
ipc920/
+-- README.md
+-- LICENSE.md
+-- src/
+-- prebuilt/
+-- install/
+-- images/
+-- binary_files_with_symbols/
+-- Makefile
+-- manifest
+-- source.xml
+-- docs/
    +-- bsp-build-qnx-8.0.5-ipc920.md
    +-- validation-qnx-8.0.5-ipc920.md
```

The **BSP Build Guide** covers the complete process from setting up the QNX 
development environment to building and deploying the platform-specific boot 
image.

The **Validation Guide** covers hardware functional testing and provides practical 
information about supported interfaces, configuration requirements, known limitations, 
and troubleshooting considerations.

Platform-specific build and validation guides are available in the docs/ directory
of each product branch.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>



### Product Documentation

Select the appropriate product branch to access its BSP build and validation guides:

- [**IPC920 Documentation**](../../tree/ipc920/docs/)
- [**MANO566 Documentation**](../../tree/mano566/docs/)
- [**MANO560 Documentation**](../../tree/mano560/docs/)
- [**ICO330 Documentation**](../../tree/ico330/docs/)


<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---


## Ensuring Reliability: Hardware & I/O Validation

A QNX BSP provides the foundation for running QNX on an industrial platform. 
However, reliable deployment also requires thorough validation of the hardware 
interfaces, drivers, and system behavior on the target platform.

The **Axiomtek DES team** validates QNX BSPs on target hardware to verify that 
key interfaces operate correctly and consistently with the platform's hardware 
specifications.

### Verified Hardware Interfaces

Depending on the platform, validation may include:

- **LAN / Ethernet** - Network connectivity and functionality using supported QNX 
  network drivers such as `igc`.
- **DIO / GPIO** - Digital input/output operation, including signal detection and 
  output control.
- **Serial Ports** - COM port TX/RX communication, baud-rate configuration, and 
  interrupt operation.
- **Display / Graphics** - Display initialization, resolution, and basic graphics 
  functionality where supported.
- **USB** - USB device detection and operation across supported USB controllers 
  and devices.
- **PCIe / Storage** - PCIe device detection and storage functionality using NVMe, 
  SATA, or other supported devices.
- **System Devices** - Platform-specific peripherals such as watchdog, SMBus/I²C, 
  hardware monitoring, LEDs, and other industrial I/O interfaces.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### From BSP Bring-Up to Hardware Validation

Hardware validation helps identify issues that may not be visible during a simple 
system boot or basic functional test. The validation documentation provides 
engineers with practical information about **supported interfaces, configuration 
requirements, known limitations, troubleshooting procedures, and potential 
workarounds**.

Platform-specific validation procedures are available in the **Validation Guide** 
within each product branch.

The goal is to reduce hardware bring-up effort and provide a more predictable path 
from **BSP bring-up -> hardware validation -> application development -> production 
deployment**.

### Product Validation Guides

Select the appropriate product branch to access its hardware validation guide:

- [**IPC920 Validation Guide**](../../tree/ipc920/docs/validation-qnx-8.0.5-ipc920.md)
- [**MANO566 Validation Guide**](../../tree/mano566/docs/validation-qnx-8.0.5-mano566.md)
- [**MANO560 Validation Guide**](../../tree/mano560/docs/validation-qnx-8.0.3-mano560.md)
- [**ICO330 Validation Guide**](../../tree/ico330/docs/validation-qnx-8.0.3-ico330.md)

<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---

## Scaling Up: Product Line & Customization Support

A standard QNX BSP provides a foundation for deploying QNX on a supported Axiomtek 
platform. However, some industrial applications may require **custom I/O, 
specialized peripherals, hardware modifications, or support for additional 
platforms and processors**.

Axiomtek's **Design & Engineering Services (DES)** team can provide engineering 
support to address requirements beyond the standard BSP and platform configuration.

### Beyond the Standard BSP

For projects that require additional hardware or software support, the **DES team** 
can provide engineering services such as:

- **Custom I/O driver development** for application-specific peripherals
- **BSP porting and customization** for new processors, chipsets, or Axiomtek 
  platforms
- **QNX driver integration and debugging**
- **Hardware modifications** to support specialized I/O and system requirements
- **Platform-specific hardware and software validation**
- **System configuration and optimization** for application requirements
- **Technical support** for integrating QNX with application-specific hardware




<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>



### From Evaluation to Customized Deployment

The combination of Axiomtek's industrial hardware portfolio, QNX BSP expertise, 
and DES engineering capabilities provides a path from **initial platform 
evaluation to customized deployment**.

Engineers can start with a standard QNX-supported Axiomtek platform and use the 
BSP source code and validation documentation provided in this repository. When 
additional requirements arise, Axiomtek's DES team can provide engineering support 
for hardware, drivers, BSP customization, and system integration.

> **Have a custom QNX requirement?** Contact Axiomtek to discuss your target 
> hardware, QNX version, I/O requirements, peripherals, and application. The DES 
> team can help evaluate the requirements and determine the appropriate hardware, 
> BSP, driver, or system customization.

<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---

## Get Started with QNX on Axiomtek Platforms

Deploying QNX on Axiomtek industrial hardware does not have to start from scratch. 
This repository provides **QNX BSP source code, build and deployment guides, and 
hardware validation documentation** for selected Axiomtek platforms.

By combining:

- QNX BSP source code for selected Axiomtek platforms
- Practical BSP build and deployment guidance
- Hardware and I/O validation procedures
- Axiomtek DES engineering support for customized requirements

engineers can simplify the QNX bring-up process and accelerate application 
development on Axiomtek industrial platforms.



<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>




### Next Steps

Ready to evaluate QNX on Axiomtek hardware?

1. **Choose a supported platform**  
   Review the [**Product Branches**](#product-branches) and select the Axiomtek 
   platform and QNX SDP version that match your requirements.

2. **Get the BSP source code**  
   Check out the corresponding product branch to obtain the BSP source code and 
   platform-specific files.

3. **Build and deploy QNX**  
   Follow the BSP Build Guide in the product branch to prepare the QNX 
   development environment, build the BSP, and create a bootable QNX image.

4. **Validate the hardware**  
   Follow the Validation Guide to verify the platform's storage, display, 
   Ethernet, USB, serial ports, GPIO, watchdog, and other supported interfaces.

5. **Develop your application**  
   Once the platform has been brought up and validated, begin application 
   development and deployment using the QNX environment.

6. **Contact Axiomtek DES for additional requirements**  
   For BSP customization, driver development, hardware modifications, or 
   specialized QNX deployment requirements, contact the Axiomtek **Design & 
   Engineering Services (DES)** team.

> **Start with the BSP. Build with QNX. Validate the platform. Develop your 
> application.**

<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---

# License

Copyright (c) 2026 Axiomtek Inc.

Documentation and other original materials in this repository are provided under 
the terms of the [LICENSE](LICENSE.md), subject to the ownership and licensing 
terms of any third-party materials.

QNX, QNX Software Development Platform (SDP), and related software and documentation 
are proprietary materials of their respective owners and are subject to separate 
license agreements. Nothing in this repository grants any license to QNX software 
or other third-party proprietary materials.

Axiomtek product names, trademarks, logos, photographs, and other proprietary materials 
remain the property of Axiomtek Inc. and are not automatically licensed under this 
repository's documentation license.

Users are responsible for obtaining and complying with the appropriate licenses for 
QNX software and any other third-party materials required for their development 
or deployment.


<p align="right">
  <a href="#qnx-on-axiomtek-industrial-pcs">Back to Top</a>
</p>

---
