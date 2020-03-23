#!/bin/sh

mkdir -p $HOME/package
git clone $REPO $HOME/package
cd $HOME/package
pip3 install --upgrade --target=/output -r requirements.txt
if [ -x install.sh ]; then ./install.sh; fi
cp -R $HOME/package/*.py /output/.
if [ -f $HOME/package/*.json ]; then cp -R $HOME/package/*.json /output/.; fi
