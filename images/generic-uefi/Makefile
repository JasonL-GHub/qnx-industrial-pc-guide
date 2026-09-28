ROOT_DIR := $(notdir $(CURDIR))
ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

BUILD_TEMPLATE=../../../Templates_build_sdp800
INSTALL=../../install
BOARD=x86_64-generic-uefi
HOST_MKIFS := mkifs

STARTUP_X86_SRC := ../../src/hardware/startup/boards/x86/x86_64/o/startup-x86
STARTUP_X86_INSTALL := $(INSTALL)/x86_64/boot/sys/startup-x86

.PHONY: all clean

# Note that the hypervisor-enabled boot image variant, does not build by default.
# Once you have QNX Hypervisor installed, you can build it by running 'make hyp'.
# all: $(BOARD).efi $(BOARD)-smmu.efi $(BOARD)-hypervisor.build
all: $(BOARD).efi 

clean:
	$(RM_HOST) *.efi *.sym 

$(STARTUP_X86_INSTALL): $(STARTUP_X86_SRC)
	@echo "Installing updated startup-x86..."
	cp -fv $< $@

$(BOARD).efi: $(BOARD).build $(STARTUP_X86_INSTALL)
	$(HOST_MKIFS) -r $(INSTALL) $(MKIFSFLAGS) $(BOARD).build $@

#SMMUMAN-enabled boot image variant
#$(BOARD)-smmu.efi: $(BOARD)-smmu.build
#	$(HOST_MKIFS) -r $(INSTALL) $(MKIFSFLAGS) $^ $@

#Hypervisor-enabled boot image variant (includes SMMUMAN)
#hyp: $(BOARD)-hyp.efi
#$(BOARD)-hyp.efi: $(BOARD)-hypervisor.build
#	$(HOST_MKIFS) -r $(INSTALL) $(MKIFSFLAGS) $^ $@

-include $(BUILD_TEMPLATE)/template.mk
