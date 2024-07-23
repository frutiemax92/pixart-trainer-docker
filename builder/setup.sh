#!/bin/bash
# NOTE: This script is not ran by default for the template docker image.
#       If you use a custom base image you can add your required system dependencies here.

#set -e # Stop script on error

git clone https://github.com/PixArt-alpha/PixArt-sigma.git
jupyter lab --allow-root --no-browser --port=8888 --ip=* --FileContentsManager.delete_to_trash=False --ServerApp.terminado_settings='{"shell_command":["/bin/bash"]}' --ServerApp.token=$JUPYTER_TOKEN --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace