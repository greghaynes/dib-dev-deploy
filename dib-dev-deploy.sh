#!/bin/bash
set -eux
set -o pipefail

if [ -z "$(which ddd-env-vars)" ]; then
    echo "Please put dib-dev-deploy/scripts into your PATH."
    exit 1
fi

source $(which ddd-env-vars)

mkdir -p $DDD_WORKDIR

if ! [ -f "$DDD_VM_TEMPLATE" ]; then
    echo "Could not find vm template at $DDD_VM_TEMPLATE."
    exit 1
fi

name="test"

ddd-pull-tools

ddd_src_dir=$DDD_WORKDIR/tools/dib-dev-deploy
if ! [ -d $ddd_src_dir -o -L $ddd_src_dir ]; then
    ln -s $(dirname $(which ddd-env-vars))/../ $DDD_WORKDIR/tools/dib-dev-deploy
fi

ddd-create-image -a amd64 -o $DDD_VM_IMAGES_DIR/$name.qcow2 $*

ddd-define-vm "$name-$(uuidgen)" $DDD_VM_IMAGES_DIR/$name.qcow2
