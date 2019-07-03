FROM erdc/jupyterhub:python3

MAINTAINER Proteus Project <proteus@googlegroups.com>

USER jovyan

WORKDIR /home/$NB_USER

RUN git clone https://github.com/erdc/proteus && \
    cd proteus && \
    git checkout python3 && \
    git submodule update --init && \
    make stack stack/hit/bin/hit stack/default.yaml && \
    cd stack && \
    ./hit/bin/hit build -j 4 default.yaml -v
