#!/bin/sh

echo ""
echo ""
echo "Begining scripted setup."

echo -n "Setup: update packages..."
dnf upgrade --refresh -y > /dev/null
echo " done."

echo -n "Setup: installing essentials..."
dnf install which git gh unzip python3-pip python3-tkinter -y > /dev/null
pip install --upgrade pip > /dev/null 2> /dev/null
pip install setuptools numpy pygame > /dev/null 2> /dev/null
echo " done."

echo -n "Setup: symlinking python..."
ln -s /usr/bin/python3 /usr/bin/python > /dev/null 2> /dev/null
echo " done."

echo -n "Setup: setting up booksite..."
wget https://introcs.cs.princeton.edu/python/code/dist/introcs-1.0.zip 2> /dev/null
unzip introcs-1.0.zip > /dev/null
cd introcs-1.0 > /dev/null
python setup.py install > /dev/null 2> /dev/null
cd .. > /dev/null
echo " done."

echo -n "Setup: cleaning up..."
rm -rf introcs* > /dev/null
rm -rf setup.sh* > /dev/null
echo " done."

echo -n "Setting PS1..."
<<EOF>> ~/.bashrc cat
function nonzero_return() {
	RETVAL=\$?
	[ \$RETVAL -ne 0 ] && echo "<\$RETVAL> "
}

export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\][\[\e[32m\]\u\[\e[m\] @ \[\e[36m\]\h\[\e[m\] ; \[\e[35m\]\W\[\e[m\]] \\$ "
EOF
source ~/.bashrc
echo " done."


echo "Finished scripted setup."
echo ""
echo ""
