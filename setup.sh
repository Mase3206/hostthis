#!/bin/sh

echo ""
echo ""

echo "Setup: update packages..."
dnf upgrade --refresh -y > /dev/null
echo "Setup: update packages... done."

echo "Setup: installing essentials..."
dnf install which git gh unzip python3-pip python3-tkinter -y > /dev/null
pip install --upgrade pip > /dev/null
pip install setuptools numpy pygame > /dev/null
echo "Setup: installing essentials... done."

echo "Setup: symlinking python..."
ln -s /usr/bin/python3 /usr/bin/python > /dev/null
echo "Setup: symlinking python... done."

echo "Setup: setting up booksite..."
wget https://introcs.cs.princeton.edu/python/code/dist/introcs-1.0.zip 2> /dev/null
unzip introcs-1.0.zip > /dev/null
cd introcs-1.0 > /dev/null
python setup.py install --user > /dev/null
cd .. > /dev/null
echo "Setup: setting up booksite... done."

echo "Setup: cleaning up..."
rm -rf introcs* > /dev/null
rm -rf setup.sh* > /dev/null
echo "Setup: cleaning up... done."

echo "Finished scripted setup."
echo ""
echo ""
