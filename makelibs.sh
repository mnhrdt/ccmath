#!/bin/sh

# CCM Library compilation script
#     run from distribution directory:  'makelibs.sh'
# When installing on an Intel based platform
#     respond with  y  to the prompt
#     otherwise abort and run the 'non_intel.sh' script first.
# Then run 'makelibs.sh' and respond with n at this prompt. 

. ./configlibs.sh

LST="src/cfit src/complex src/fft src/geom src/intg src/matrix src/roots src/sfunc src/simu src/sort src/statf src/tseries src/util src/xarm"
MDR=$(pwd)
LSOD=$MDR

echo "Intel platform ? (y/n)"
read F
for dr in $LST
  do
    cd $MDR/$dr
    echo $(pwd)
    cc -c -O3 *.c
    mv *.o $LSOD
  done

# Compile corrected svd QR support without optimizing
#     The GNU optimizer destroys the fix!
cd $MDR/src/matrix
cc -c qrb*.c
mv *.o $LSOD
cd $MDR

if [ $F = "y" ]
  then cd $MDR/src/matrix
    cc -c -O3 solv.s
    mv *.o $LSOD
    cd $MDR/src/simu
    cc -c -O3 *.s
    mv *.o $LSOD
fi
cd $LSOD
ar r $PLIBA *.o
ld -shared -o $PLIBSO *.o
rm *.o
