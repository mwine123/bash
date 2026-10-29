#!/bin/bash


echo "Welcome to my system info script!"

if [ $# -ne 1 ]; then
    echo "Error: Syntax should be $0 name"
    exit 1
fi

read -p "What Linux distribution are you using? " distro 

if [ -z "$distro" ]; then
    echo "Need a distro"
    exit 1
fi
echo -e "Hello $1 \nYou are using $distro."
