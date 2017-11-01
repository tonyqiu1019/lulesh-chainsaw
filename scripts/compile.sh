prog=$1
cd ~/ITandPCubeS/compilers/new-segmented-backend/ 
make -f MakeFile-Executable clean
./sicc sample/code/${prog}.it ../../machine-models/rivana-cluster/rivana-cluster.ml ../../machine-models/rivana-cluster/rivana-cluster.cn sample/mapping/${prog}.map  
make -f MakeFile-Executable
