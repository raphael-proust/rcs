#!/bin/sh

if ! [ -x /bin/dash ]
then
  echo "WARNING: /bin/dash not found. Installed scripts won't work."
fi

for i in $(ls *-bnwr*) $(ls dzen-*) task gvim vpaste dvtm conn
do
  ln -f -s $PWD/$i $HOME/bin/
done
