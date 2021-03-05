#!/bin/bash

# Usage ./git-log.sh 40

while :
do
    clear
    git --no-pager log `git rev-parse HEAD` -n $* --graph --pretty=oneline --abbrev-commit --decorate
    sleep 1
done
