#!/bin/sh

PWD=$(pwd)

cd buildroot/

make distclean

cd ${PWD}

echo "DONE"
