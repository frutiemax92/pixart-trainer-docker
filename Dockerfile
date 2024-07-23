# Stage 1: Use the runpod/base image to gather its dependencies
FROM runpod/pytorch:2.2.1-py3.10-cuda12.1.1-devel-ubuntu22.04

# --- Optional: System dependencies ---
RUN apt update && apt install bash

# Python dependencies
COPY builder/requirements.txt /requirements.txt

EXPOSE 8888
RUN echo "JUPYTER_TOKEN password"
ENV JUPYTER_TOKEN password
ENV SHELL /bin/bash

WORKDIR /workspace
RUN apt install -y git python3
#RUN git clone https://github.com/PixArt-alpha/PixArt-sigma.git

WORKDIR /
RUN pip3 install -r requirements.txt

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y wget nodejs npm nginx openssh-server
RUN apt install -y python3-pip libgl1-mesa-dev libglib2.0-0 git-lfs
RUN git lfs install
RUN 

RUN pip3 install --upgrade pip
#pip3 install torch torchvision torchaudio
RUN pip3 install --upgrade --no-cache-dir jupyterlab ipywidgets jupyter-archive jupyter_contrib_nbextensions
RUN pip3 install jupyterlab psutil notebook
RUN pip3 install numpy pillow triton

WORKDIR /workspace
COPY builder/setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN jupyter contrib nbextension install --user && \
    jupyter nbextension enable --py widgetsnbextension

RUN echo "running setup.sh"
CMD ["/setup.sh"]