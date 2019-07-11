FROM quay.io/pypa/manylinux2010_x86_64
# https://quay.io/repository/pypa/manylinux2010_x86_64/manifest/sha256:e1fd5ccf6fc799e7f07a7fc85dd17fdd7613b892c5af2cccdefcad4704051f59

LABEL maintainer="ome-devel@lists.openmicroscopy.org.uk"
LABEL org.opencontainers.image.source="https://github.com/ome/zeroc-ice-py-centos7"

RUN curl -sfL https://zeroc.com/download/Ice/3.6/el6/zeroc-ice3.6.repo > \
        /etc/yum.repos.d/zeroc-ice3.6.repo && \
    yum install -y -q \
        ice-all-runtime \
        ice-all-devel \
        bzip2-devel \
        expat-devel

RUN mkdir /manylinux-scripts
ADD build_openssl.sh /manylinux-scripts/
RUN cd /manylinux-scripts && \
    sh build_openssl.sh

RUN mkdir /dist
ADD build.sh /
ENTRYPOINT ["/build.sh"]
