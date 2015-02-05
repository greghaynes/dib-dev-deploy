#!/bin/bash
set -eux
set -o pipefail

export DDD_WORKDIR=${DDD_WORKDIR:-~/ddd-workdir}
image_name="test"

mkdir -p $DDD_WORKDIR

ddd-pull-tools

ddd-create-image -a amd64 -o $DDD_WORKDIR/images/$image_name $*
