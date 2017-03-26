set -o errexit # остановка после первой ошибки

rm -rf build
clear
clear

mkdir build

echo 'Building project'
mpic++ -std=c++0x -Wall -I include -g -o build/solve src/main.cpp -lm
for i in 8
do
	printf "PROC_NUM = $i\n"
	echo '============================'
	mpisubmit -n $i ./build/solve
done
