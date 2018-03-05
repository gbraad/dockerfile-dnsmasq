FROM centos:7
MAINTAINER Gerard Braad <me@gbraad.nl>

RUN yum -y install dnsmasq && \
    yum clean all && \
    systemctl enable dnsmasq

COPY dnsmasq.conf /etc/
COPY resolv.dnsmasq.conf /etc/

VOLUME /etc/dnsmasq.hosts

EXPOSE 53/udp

CMD [ "/sbin/init" ]
