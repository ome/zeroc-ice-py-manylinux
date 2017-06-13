FROM centos:7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN curl -sL https://zeroc.com/download/rpm/el7/zeroc-ice-el7.repo > \
    /etc/yum.repos.d/zeroc-ice-el7.repo
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
RUN mkdir /dist
ADD build.sh /
CMD ["/build.sh", "3.6.3"]
