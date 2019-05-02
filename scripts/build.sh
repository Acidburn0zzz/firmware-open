#!/usr/bin/env bash

set -e

if [ -z "$1" ]
then
  echo "$0 [model]" >&2
  exit 1
fi
MODEL="$1"

if [ ! -d "models/${MODEL}" ]
then
  echo "model '${MODEL}' not found" >&2
  exit 1
fi
MODEL_DIR="$(realpath "models/${MODEL}")"

rm -rf build
mkdir -p build

# Rebuild firmware-setup (used by edk2)
touch apps/firmware-setup/Cargo.toml
make -C apps/firmware-setup

# Rebuild CorebootPayloadPkg using edk2
./scripts/_build/edk2.sh build/UEFIPAYLOAD.fd

# Rebuild coreboot
export FIRMWARE_OPEN_UEFIPAYLOAD="$(realpath build/UEFIPAYLOAD.fd)"
export FIRMWARE_OPEN_MODEL_DIR="${MODEL_DIR}"
./scripts/_build/coreboot.sh "${MODEL_DIR}/coreboot.config" "build/$MODEL.rom"
