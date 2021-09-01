#!/bin/bash


echo "C testing"
echo "---------"
echo "  -Compiling"
gcc ctest.c -o ctest 2> err.txt 
echo "  -Running"
./ctest 2>> err.txt 1> res.txt


echo ""
echo "Assembly Testing"
echo "----------------"
echo "  -Compiling"
gcc atest.s -o atest 2>> err.txt 
echo "  -Running"
./atest 2>> err.txt 1>> res.txt


echo ""
echo "MPI testing"
echo "-----------"
echo "  -Compiling"
cd MPI && make 2>> ../err.txt
echo "  -Running"
./masterWorker 2>> ../err.txt 1>> ../res.txt
cd ..


echo ""
echo "OpenMP testing"
echo "-----------"
echo "  -Compiling"
cd OpenMP && make 2>> ../err.txt
echo "  -Running"
./reduction 2>> ../err.txt 1>> ../res.txt
cd ..


echo ""
echo "hybrid testing"
echo "-----------"
echo "  -Compiling"
cd hybrid && make 2>> ../err.txt
echo "  -Running"
./spmd 2>> ../err.txt 1>> ../res.txt
cd ..


everythingWorks=true

# Search for lines in ~/outtest.txt
while IFS= read -r line
do
  if ! grep "$line" res.txt > /dev/null
  then
    echo -e "\e[1;31mFOLLOWING LINE NOT DETECTED: $line \e[0m"
    everythingWorks=false
  fi
done < rescheck.txt

#Output if all of the Patternlets worked
if $everythingWorks 
then
  echo -e "\e[1;32mTesting showed no errors \e[0m"
else
  echo -e "\e[1;33mTESTING RESULTED IN ERROR\e[0m"
fi

# In case any of the Patternlets didn't work
if ! $everythingWorks
then
  if [ ! -s err.txt ]
  then
    echo -e "\e[1;33mNO ERROR MESSAGES\e[0m"
  else
    echo -e "\e[1;31mERROR MESSAGES PRESENT \e[0m"
    echo "Showing error output"
    echo "######################"
    cat err.txt

  fi
fi






