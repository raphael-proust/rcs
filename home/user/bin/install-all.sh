#!/bin/sh

if ! [ -x /bin/dash ]
then
  echo "WARNING: /bin/dash not found. Installed scripts won't work."
  exit 1
fi

for i in $(ls *-bnwr*) gvim vpaste dvtm
do
  ln -f -s $PWD/$i $HOME/bin/
done
