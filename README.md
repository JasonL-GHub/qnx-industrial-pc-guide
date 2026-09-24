
# Axiomtek MANO566 QNX BSP

This directory contains the QNX Board Support Package (BSP) for the **Axiomtek MANO566** platform.

## QNX Version

- QNX SDP 8.0.5

## BSP Structure

| Directory/File | Description |
|---|---|
| `src/` | BSP source code |
| `prebuilt/` | Prebuilt BSP components |
| `images/` | Generated boot images |
| `install/` | BSP installation files |
| `binary_files_with_symbols/` | Binary files with symbols |
| `Makefile` | BSP build file |
| `manifest` | BSP manifest |
| `source.xml` | BSP source configuration |

## Build


For the complete BSP build procedure, see:

- [MANO566 QNX 8.0.5 BSP Build Guide](./docs/bsp-build-qnx-8.0.5-mano566.md)

## Validation

After building the BSP and booting QNX on the MANO566, perform the required hardware and functional validation.

The validation document covers the tested hardware functions and provides the corresponding test procedures and results.

- [MANO566 QNX 8.0.5 Validation Guide](./docs/validation-qnx-8.0.5-mano566.md)

