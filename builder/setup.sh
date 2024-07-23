#!/bin/bash
# NOTE: This script is not ran by default for the template docker image.
#       If you use a custom base image you can add your required system dependencies here.

#set -e # Stop script on error

git clone https://github.com/PixArt-alpha/PixArt-sigma.git
jupyter notebook --ip=0.0.0.0