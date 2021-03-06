#!/bin/bash

set -e
TASK=L10
SF=~/shared

if [ "$(uname)" != "Linux" ]; then
  echo "Not on Linux!"
  echo "Maybe you're not in your VM?"
  exit
fi

if [ ! -e $SF ]; then
  echo "Shared folder not found."
  exit
fi
if [ -e $SF/$TASK ]; then
  echo "It looks like $TASK was already set up."
  exit
fi

cp -iPR ~/class/vmfiles/$TASK $SF/$TASK
cd $SF/$TASK

echo "Downloading..."
wget http://pages.cs.wisc.edu/~remzi/OSTEP/Homework/HW-Scheduler.tgz

echo "Decompressing..."
tar xf HW-Scheduler.tgz

echo "Patching it so it actually works..."
sed -i.original '0,/python/s//python2/' scheduler.py

echo "Renaming the README for Windows users..."
mv README-scheduler README-scheduler.txt

echo
echo "*** $TASK should now be ready in $SF/$TASK ***"
