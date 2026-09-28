/*
 * Copyright (c) 2023, BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <startup.h>


/**
 * This function evaluates the provided hypervisor flags and returns the closest
 * set of flags that the hardware can actually do.
 * @param option_flags HYP_FLAG_* options that control setup for hypervisor
 * @returns closest options that the hardware can do
 */
hyp_flags_t
arch_hypervisor_validate_flags(hyp_flags_t  const option_flags) {
    if (option_flags == HYP_FLAG_INVALID) {
        crash("Unrecognized hypervisor option flag\n");
    }

    if (option_flags & HYP_FLAG_ENABLED) {
        // In the future, more nuanced control over hypervisor modes may be
        // required but for now, it will be a simple on/off switch
        unsigned ecx;

        x86_cpuid1(1, NULL, NULL, &ecx, NULL);

        if ((ecx & X86_64_FEATURE2_VMX) == 0) {
            crash("VMX not supported\n");
        }

        return HYP_FLAG_ENABLED;
    }

    return HYP_FLAG_DISABLED;
}


/**
 * This function is used to configure hypervisor support on all cores. It
 * expects to be called first on the bootcore, and then secondary cores.
 * hypervisor init will only succeed if all secondary cores can be configured
 * to match the bootcore.
 *
 * @param cpunum     to distinguish boot and secondary cores
 * @param hyp_flags  init flags
 */
void
arch_hypervisor_init(unsigned const cpunum, hyp_flags_t const hyp_flags) {
    switch(hyp_flags) {
    case HYP_FLAG_DISABLED:
        if (debug_flag && (cpunum == 0)) {
            kprintf("Hypervisor support disabled\n");
        }
        break;
    case HYP_FLAG_ENABLED:
        if (debug_flag && (cpunum == 0)) {
            kprintf("Hypervisor support enabled\n");
        }
        break;
    default:
        crash("Unknown required hypervisor mode\n");
        break;
    }
}
