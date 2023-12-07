FROM amazonlinux:2

# new install for specific Python version
RUN yum -y groupinstall development
RUN yum -y install zlib-devel openssl-devel bzip2-devel wget

RUN wget https://www.python.org/ftp/python/3.8.9/Python-3.8.9.tgz
RUN tar xvzf Python-3.8.9.tgz
RUN cd Python-3.8.9; ./configure --enable-optimizations; make install
# python 3.8 installed

# get pip
ADD https://bootstrap.pypa.io/get-pip.py get-pip.py
RUN chmod 777 get-pip.py

COPY run.sh /run.sh

RUN mkdir /output
RUN chmod 777 /output

RUN adduser build
USER build
RUN python3 get-pip.py --user

ENTRYPOINT ["/run.sh"]
