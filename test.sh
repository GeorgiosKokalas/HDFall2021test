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
gcc atest.a -o atest 2>> err.txt
echo "  -Running"
./atest 2>> err.txt 1>> res.txt


echo ""
echo "MPI testing"
echo "-----------"
echo "  -Compiling"
cd MPI && make 2>> ../err.txt
echo "  -Running"
./spmd 2>> ../err.txt 1>> ../res.txt


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
./forkJoin 2>> ../err.txt 1>> ../res.txt
cd ..


echo ""
echo "hybrid testing"
echo "-----------"
echo "  -Compiling"
cd hybrid && make 2>> ../err.txt
echo "  -Running"
./forkJoin 2>> ../err.txt 1>> ../res.txt
cd ..









