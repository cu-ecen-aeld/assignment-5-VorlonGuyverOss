#!/bin/sh


DATE_WAS=$(date)

./build.sh

DATE_IS=$(date)

echo
echo

echo "STARTED: ${DATE_WAS}"
echo "ENDED:   ${DATE_IS}"

echo
echo

echo "ENDED:   ${DATE_IS}"
echo "STARTED: ${DATE_WAS}"


