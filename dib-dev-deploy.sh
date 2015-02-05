#!/bin/bash
set -eux
set -o pipefail

source $(which ddd-env-vars)

mkdir -p $DDD_WORKDIR

if ! [ -f "$DDD_VM_TEMPLATE" ]; then
    echo "Could not find vm template at $DDD_VM_TEMPLATE."
    exit 1
fi

name="test"

ddd-pull-tools

ddd-create-image -a amd64 -o $DDD_VM_IMAGES_DIR/$name.qcow2 $*

ddd-define-vm "$name-$(uuidgen)" $name
