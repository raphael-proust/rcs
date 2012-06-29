#!/bin/sh

for i in $(ls *-bnwr*)
do
  ln -f -s $PWD/$i $HOME/bin/
done
