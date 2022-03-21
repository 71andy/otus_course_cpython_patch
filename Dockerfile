FROM centos:centos7

RUN set -x
RUN set -e
RUN yum clean all
RUN yum install -y git
RUN yum install -y make
RUN yum install -y gcc-c++
# RUN yum install -y vim
# RUN yum install -y ssh

WORKDIR "/opt"
RUN git clone https://github.com/python/cpython.git
WORKDIR "/opt/cpython"
RUN git checkout 2.7
RUN ./configure --with-pydebug --prefix=/tmp/python
RUN make -j2
