FROM amazonlinux:2

RUN yum install -y python3 zip git python3-devel
#RUN yum groupinstall -y "Development Tools"

ADD https://bootstrap.pypa.io/get-pip.py get-pip.py
RUN chmod 777 get-pip.py

COPY run.sh /run.sh

RUN mkdir /output
RUN chmod 777 /output

RUN adduser build
USER build
RUN python3 get-pip.py --user

ENTRYPOINT ["/run.sh"]
