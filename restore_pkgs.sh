#!/bin/bash

# Directory that holds the cached packages.
cache_dir=$1
# Root directory to untar the cached packages to.
# Typically filesystem root '/' but can be changed for testing.
cache_restore_root=$2

for cache_filepath in $(ls $cache_dir); do
  echo "* Restoring $cache_filepath from cache... "
  sudo tar -xf $cache_filepath -C $cache_restore_root
  sudo apt-get --yes --only-upgrade install $package
done

echo "Action complete. $(ls -l $cache_dir | wc -l) package(s) restored."
