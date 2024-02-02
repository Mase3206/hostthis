#!/bin/sh

echo "update packages"
dnf upgrade --refresh -y

echo "installing essentials"
dnf install which git gh unzip python3-pip python3-tkinter -y
pip install --upgrade pip
pip install setuptools numpy pygame

echo "symlinking python"
ln -s /usr/bin/python3 /usr/bin/python

echo "setting up booksite"
wget https://introcs.cs.princeton.edu/python/code/dist/introcs-1.0.zip
unzip introcs-1.0.zip
cd introcs
python setup.py install --user
cd ..

echo "cleaning up"
rm -rf introcs*
rm -rf setup.sh*
