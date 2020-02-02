#! /bin/sh

# CCM script to modify source for a non-Intel compilation
#   run from distribution directory:  'non_intel.sh'
# respond to prompt with  y  if processor uses the big-endian byte order
#     typical for UNIX workstations

MDR=`pwd`
cp $MDR/src/matrix/supp/solv.c $MDR/src/matrix
rm $MDR/src/matrix/*.s
echo " .s code replaced in matrix"
cp $MDR/src/simu/supp/*.c $MDR/src/simu
rm $MDR/src/simu/*.s
echo " .s code replaced in simu"
echo  
echo " bigendian byte order (y/n)"
read F
if [ $F = "y" ]
  then cp $MDR/src/xarm/supp/big-end/*.c $MDR/src/xarm
  echo " bigend code installed in xarm"
fi
