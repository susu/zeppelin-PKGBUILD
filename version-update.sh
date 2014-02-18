#!/bin/bash
base=`pwd`

error() # msg
{
  echo $1
  exit 42
}

for pkg in zeppelin*git; do
  echo "Cleaning up previous builds and sources..."
  cd ${base}/${pkg} || error "ERROR"
  rm -rf pkg/ src/
  echo "Updating pkgver: ${pkg}"
  makepkg -o || error "ERROR"
done

echo "Now you may want to commit."


