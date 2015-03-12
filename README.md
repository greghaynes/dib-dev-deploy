dib-dev-deploy
==============

Some helper scripts for using diskimage-builder as part of a development
workflow.


Setup
-----

To get dib-dev-deploy perform the following:

    git clone https://github.com/greghaynes/dib-dev-deploy ddd-workdir/tools/dib-dev-deploy
    export DDD_WORKDIR="$(pwd)/ddd-workdir"
    export PATH=$PATH:$DDD_WORKDIR/tools/dib-dev-deploy/scripts


Running
-------

Running dib-dev-deploy is then as simple as:

    cd $DDD_WORKDIR/tools/dib-dev-deploy
    ./dib-dev-deploy ubuntu enable-serial-console [other elements...]

Or if you already have a qcow2 you want to boot:

    ./scripts/ddd-pull-tools # only needed the first time
    ./scripts/ddd-define-vm my-vm /my/vm.qcow2


Configuration
-------------

One pattern that has emerged with using DIB is to create an RC file you can
source which exports variables needed to configure your bulids.

Here is an example dddrc:

    # Requires the apt-sources element
    export DIB_APT_SOURCES=/etc/apt/sources.list

    # Requires the pypi element
    export PYPI_MIRROR_URL=http://pypi-mirror/Ubuntu-14.04/

    # Directories of custom elements
    export DDD_ELEMENTS_PATH=/home/my-user/dib-elements
