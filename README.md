# System76 Open Firmware

An open source distribution of firmware utilizing coreboot, EDK2, and System76 firmware applications.

## Dependencies

### Install toolchain
```
./scripts/deps.sh
```

### Load Rust environment (or optionally reboot)
```
source ~/.cargo/env
```

### Build firmware, replace qemu with your model (look in the models directory for examples)
```
./scripts/build.sh qemu
```

### Emulate firmware, only available after building the qemu model
```
./scripts/qemu.sh
```

### Flashing firmware manually is not recommended for the normal user. For the advanced user, there is a script flash.sh which takes the same arguments as build.sh

## Contents

- [apps](./apps) - Applications
- [coreboot](https://github.com/system76/coreboot.git) - coreboot README
- [edk2](https://github.com/system76/edk2.git) - EDK II Project
- [edk2-non-osi](https://github.com/tianocore/edk2-non-osi.git) - This branch holds modules not compatible with the normal
- [edk2-platforms](https://github.com/system76/edk2-platforms.git) - This branch holds all platforms actively maintained against the
- [FSP](https://github.com/IntelFsp/FSP.git) - Intel® Firmware Support Package (Intel® FSP) Binaries
- [libs](./libs) - Libraries
- [models](./models) - Models
- [scripts](./scripts)
- [tools](./tools) - Tools
