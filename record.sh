#!/bin/bash




while :; do printf "%02d:%02d\n" $(($SECONDS/60)) $(($SECONDS%60)); sleep 1; done
