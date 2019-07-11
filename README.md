Linux x86_64 Zeroc Ice Python ManyLinux Builder
===============================================

Builds Zeroc Ice Python manylinux wheel packages for Linux x86_64.

This can be used to create installable binary packages as an alternative to compiling from source using pip.
See https://opensource.com/article/19/2/manylinux-python-wheels

Build the image:

    docker build -t builder .

Show available Python distributions:

    docker run --rm -v $PWD/dist:/dist builder

Example:

    docker run --rm -v $PWD/dist:/dist builder PYTHON-VERSION ICE-VERSION cp27-cp27mu 3.6.4

Packages will be copied to `$PWD/dist`.


Using manylinux packages
------------------------

You need a recent version of `pip` to install manylinux wheels.
The default `pip` on CentOS 7 is too old.
