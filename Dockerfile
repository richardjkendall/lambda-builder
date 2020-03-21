FROM amazonlinux:2

RUN yum install -y python3 zip git

COPY run.sh /run.sh

RUN mkdir /output
RUN chmod 777 /output

RUN adduser build
USER build

ENTRYPOINT ["/run.sh"]
