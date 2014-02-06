#!/bin/bash

base=`pwd`

error() # msg
{
  echo $1
  exit 42
}

for pkg in zeppelin*git; do
  echo "Cleaning up previous src packages..."
  cd ${base}/${pkg} || error "ERROR"
  rm -vf ${pkg}*.src.tar.gz
  echo "Creating source package: ${pkg}"
  makepkg -Sf || error "ERROR"

  burp -c multimedia -u asusu ${pkg}*.src.tar.gz || error "ERROR"
done


