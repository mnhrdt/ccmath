#!/bin/sh

# CCM library installation script
#   run this after successful compilation
#   should be run by the ROOT user from the distribution directory

. ./configlibs.sh

cp -fv src/ccmath.h /usr/include
cp -fv $PLIBA $PLIBSO /usr/lib
