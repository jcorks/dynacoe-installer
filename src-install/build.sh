#!/bin/sh

# builds the installation packag (from the makefile)
rm -f ./dynacoe-assets.tar.xz
rm -f ./dynacoe-install.tar.xz
rm -rf ./base

#build internal directories
mkdir base
mkdir ./base/bin/
mkdir ./base/userspace/

cp ../assets/dynacoe* ./base/bin/
cp ../assets/makefile ./base/



#builds just the basic tar
tar cf dynacoe-assets.tar base
xz dynacoe-assets.tar

# builds the user tar
cp ../assets/nix/install ./
tar cf dynacoe-install.tar dynacoe-assets.tar.xz install
xz ./dynacoe-install.tar

# cleanup
rm -f ./dynacoe-assets.tar.xz
rm -f ./install
rm -rf ./base



echo "Done."
