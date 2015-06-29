#!/bin/bash


while :; do tag=`printf "E%02d-%02dh%02dm%02ds" $1 $(($SECONDS/3600)) $((($SECONDS%3600)/60)) $(($SECONDS%60))`; git commit -am "$tag"; git tag $tag ; sleep 1; done
#to jest jakiś test