#!/bin/sh

PWD=$(pwd)


DATE_WAS=$(date)

cd buildroot


make clean
make all

cd ${PWD}

DATE_IS=$(date)

echo
echo

echo "STARTED: ${DATE_WAS}"
echo "ENDED:   ${DATE_IS}"

echo
echo

echo "ENDED:   ${DATE_IS}"
echo "STARTED: ${DATE_WAS}"
