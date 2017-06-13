Centos 7 Zeroc Ice Python Builder
=================================

Builds Zeroc Ice wheel and RPM Python packages for CentOS 7.

This can be used to create installable binary packages as an alternative to compiling from source using pip.

    docker build -t builder .
    docker run --rm -v $PWD/dist:/dist builder

To build a different version of IcePy:

    docker run --rm -v $PWD/dist:/dist builder /build.sh VERSION

Packages will be copied to `$PWD/dist`.
