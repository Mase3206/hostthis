#!/bin/sh

dnf upgrade --refresh
dnf install which git gh wget unzip p -yython3-pip python3-tkinter -y
pip install --upgrade pip
pip install setuptools numpy pygame
ln -s /usr/bin/python3 /usr/bin/python
wget https://introcs.cs.princeton.edu/python/code/dist/introcs-1.0.zip
unzip introcs-1.0.zip
cd introcs
python setup.py install --user
cd ..
rm -rf introcs introcs-1.0.zip
