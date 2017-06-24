FROM erdc/jupyterhub:latest

MAINTAINER Proteus Project <proteus@googlegroups.com>

USER jovyan

WORKDIR /home/$NB_USER

RUN git clone https://github.com/erdc-cm/proteus -b add_fem_dem && \
    cd proteus && \
    make hashdist stack stack/default.yaml && \
    ./hashdist/bin/hit init-home && \
    ./hashdist/bin/hit remote add https://dl.dropboxusercontent.com/u/26353144/hashdist_src --objects="source" && \
    ./hashdist/bin/hit remote add https://dl.dropboxusercontent.com/u/26353144/hashdist_jovyan --objects="build" && \
    cd stack && \
    git checkout stable/proteus && \
    ../hashdist/bin/hit build default.yaml -v
