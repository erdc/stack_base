FROM erdc/jupyterhub:latest

MAINTAINER Proteus Project <proteus@googlegroups.com>

USER jovyan

WORKDIR /home/$NB_USER

RUN git clone https://github.com/erdc/proteus && \
    cd proteus && \
    make stack stack/hit/bin/hit stack/default.yaml && \
    ./stack/hit/bin/hit remote add http://levant.hrwallingford.com/hashdist_jovyan --objects="build" && \
    cd stack && \
    ./hit/bin/hit build default.yaml -v
