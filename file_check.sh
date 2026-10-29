#!/bin/bash

if [ -f application.log ]; then
    echo "file exits"
else
    echo "ERROR: file does not exist"
    exit 1
fi