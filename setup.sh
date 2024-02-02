#!/bin/sh

echo ""
echo ""

echo "Setup: update packages..." -n
dnf upgrade --refresh -y > /dev/null
echo " done."

echo "Setup: installing essentials..." -n
dnf install which git gh unzip python3-pip python3-tkinter -y > /dev/null
pip install --upgrade pip > /dev/null
pip install setuptools numpy pygame > /dev/null
echo " done."

echo "Setup: symlinking python..." -n
ln -s /usr/bin/python3 /usr/bin/python > /dev/null
echo " done."

echo "Setup: setting up booksite..." -n
wget https://introcs.cs.princeton.edu/python/code/dist/introcs-1.0.zip > /dev/null
unzip introcs-1.0.zip > /dev/null
cd introcs > /dev/null
python setup.py install --user > /dev/null
cd .. > /dev/null
echo " done."

echo "Setup: cleaning up..."
rm -rf introcs* > /dev/null
rm -rf setup.sh* > /dev/null
echo " done."

echo "Finished scripted setup."
echo ""
echo ""
