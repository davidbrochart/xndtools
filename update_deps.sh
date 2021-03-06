#!/bin/bash
CWD=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# assuming conda environment:
export PREFIX=$CONDA_PREFIX

cd $DIR/../ndtypes
git pull
./configure --prefix=$PREFIX
make
make install
pip install -U .

cd $DIR/../xnd
git pull
./configure --prefix=$PREFIX --with-includes=$PREFIX/include
make
make install
pip install -U .

cd $DIR/../gumath
git pull
./configure --prefix=$PREFIX --with-includes=$PREFIX/include
make
make install
pip install -U .
cd $CWD
