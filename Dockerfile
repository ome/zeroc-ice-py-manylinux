FROM centos:7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN curl -L https://zeroc.com/download/rpm/el7/zeroc-ice-el7.repo > \
    /etc/yum.repos.d/zzeroc-ice-el7.repo
RUN yum install -y -q epel-release && \
    yum install -y -q \
        ice-all-runtime \
        ice-all-devel \
        bzip2-devel \
        expat-devel \
        gcc \
        gcc-c++ \
        libdb-utils \
        openssl-devel \
        python-devel \
        python-pip \
        rpm-build

RUN pip install wheel

ARG ICE_VERSION=3.6.3
RUN pip download zeroc-ice==$ICE_VERSION && \
    tar -zxf zeroc-ice-$ICE_VERSION.tar.gz
RUN cd zeroc-ice-$ICE_VERSION && \
    python setup.py bdist_wheel bdist_rpm
RUN mkdir /dist && \
    cp zeroc-ice-$ICE_VERSION/dist/* /dist/
VOLUME /dist
