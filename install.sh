#!/bin/bash

# Parallel make
makeparallel=-j

# Install all dependencies
sudo apt install cmake g++ unzip libtclap-dev libboost-dev libmsgsl-dev libflint-dev liblog4cplus-dev libzmqpp-dev curl

mkdir -p ~/projects
cd ~/projects

# FourQ
git clone https://github.com/kiromaru/FourQlib.git

cd FourQlib/FourQ_64bit_and_portable
make $makeparallel
./install.sh


# Crypto++ 7.0
cd ~/projects
mkdir -p cryptopp
cd cryptopp
curl https://cryptopp.com/cryptopp700.zip --output cryptopp700.zip
unzip cryptopp700.zip

make $makeparallel
sudo make install

# Cuckoo
cd ~/projects/Cuckoo/Cuckoo
mkdir -p .build
cd .build
cmake .. -DCMAKE_INSTALL_PREFIX=~/mylibs
make $makeparallel
make install

# SEAL
cd ~/projects
git clone https://github.com/microsoft/SEAL.git
cd SEAL/native/src
mkdir -p .build
cd .build
cmake .. -DCMAKE_INSTALL_PREFIX=~/mylibs
make $makeparallel
make install

# APSI
cd ~/projects/APSI/APSICommon
mkdir -p .build
cd .build
cmake .. -DCMAKE_INSTALL_PREFIX=~/mylibs
make $makeparallel
make install

cd ~/projects/APSI/APSISender
mkdir -p .build
cd .build
cmake .. -DCMAKE_INSTALL_PREFIX=~/mylibs
make $makeparallel
make install

cd ~/projects/APSI/APSIReceiver
mkdir -p .build
cd .build
cmake .. -DCMAKE_INSTALL_PREFIX=~/mylibs
make $makeparallel
make install

cd ~/projects/APSI/CommonCodeCLI
mkdir -p .build
cd .build
cmake .. -DCMAKE_PREFIX_PATH=~/mylibs
make $makeparallel

cd ~/projects/APSI/SenderCLI
mkdir -p .build
cd .build
cmake .. -DCMAKE_PREFIX_PATH=~/mylibs
make $makeparallel

cd ~/projects/APSI/ReceiverCLI
mkdir -p .build
cd .build
cmake .. -DCMAKE_PREFIX_PATH=~/mylibs
make $makeparallel

