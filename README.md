dib-dev-deploy
==============

Some helper scripts for using diskimage-builder as part of a development
workflow.


Setup
-----

To get dib-dev-deploy perform the following:

    git clone https://github.com/greghaynes/dib-elements ddd-workdir/tools/dib-dev-deploy
    export DDD_WORKDIR="$(pwd)/ddd-workdir"
    export PATH=$PATH:$DDD_WORKDIR/tools/dib-dev-deploy/scripts


Running
-------

Running dib-dev-deploy is then as simple as:

    cd $DDD_WORKDIR/tools/dib-dev-deploy
    ./dib-dev-deploy ubuntu enable-serial-console
