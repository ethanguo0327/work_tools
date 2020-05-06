#!/bin/bash
tar -zcvf - $1 | openssl des3 -k 1Whta4yFokx+kXi+XIqKHxXuEQMPdV1puIWrRXknYLUQ2xUrfq -salt -out "$1.gspkg"
md5sum $1.gspkg | awk '{print $1}' > $1.md5sum
