FROM centos:7
MAINTAINER Gerard Braad <me@gbraad.nl>

RUN yum -y upgrade && \
    yum clean all

RUN yum -y install dnsmasq && \
    yum clean all

COPY dnsmasq.conf /etc/
COPY resolv.dnsmasq.conf /etc/

VOLUME /dnsmasq.hosts

EXPOSE 2053

ENTRYPOINT ["/usr/sbin/dnsmasq", "-d"]
