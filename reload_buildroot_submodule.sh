#!/bin/bash -x

FIRST_INPUT="$1"
SECOND_INPUT="yes"

echo ${FIRST_INPUT}
echo ${SECOND_INPUT}

if [[ $FIRST_INPUT == ${SECOND_INPUT} ]]; then
{
#     vim .gitmodules
#
#     git add .gitmodules
#
#     vim .git/config

    git submodule deinit buildroot

    git rm --cached buildroot

    echo "sleeping 5 seconds"
    ls -a .git/modules/
    sleep 5

    rm -rf .git/modules/buildroot

    echo "sleeping 5 seconds"
    ls -a .git/modules/
    sleep 5


    echo "sleeping 5 seconds"
    ls -a
    sleep 5

    rm -rf buildroot

    echo "sleeping 5 seconds"
    ls -a
    sleep 5

    git submodule add --force git://git.busybox.net/buildroot

    cd buildroot

    git checkout -f  remotes/origin/2022.02.x

    cd ../

    echo "sleeping 5 seconds"
    ls -a
    sleep 5

    ./date_build.sh

    ./save-config.sh

    cd buildroot

    make menuconfig

    cd ..

    ./date_build.sh

    ./save-config.sh

    echo "The project should now be configured to include everything"
    echo "Launch Buildroot QEMU with '$ ./runqemu.sh'"
}
else
{
    echo "invoke with 'yes' string.  E.g.: $0 yes"
}
fi
