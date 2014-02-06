#!/bin/bash

base=`pwd`

error() # msg
{
  echo $1
  exit 42
}

for pkg in zeppelin-*-git; do
  echo "Creating source package: ${pkg}"
  cd ${base}/${pkg} || error "ERROR"
  makepkg -Sf || error "ERROR"

  burp -c multimedia -u asusu ${pkg}*.src.tar.gz || error "ERROR"
done


