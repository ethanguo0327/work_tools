#!/bin/bash
openssl des3 -d -salt -in $1 | tar -zxvf -
