# podman build -t quay.io/wcaban/net-toolbox -f Containerfile
# podman tag quay.io/wcaban/net-toolbox:latest quay.io/wcaban/net-toolbox:$(date +%y%m%d)
FROM registry.access.redhat.com/ubi8/ubi

#Install EPEL Repo
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm


# NOTE: Using the UBI image with some of these packages requires
# building on a RHEL node with valid subscriptions
# tcpflow
RUN dnf install --setopt=tsflags=nodocs -y \
    https://www.rpmfind.net/linux/centos/8-stream/AppStream/x86_64/os/Packages/rt-tests-2.1-1.el8.x86_64.rpm \
    iproute bind-utils iputils iperf3 lksctp-tools net-tools \
    frr iptables libreswan \
    nload \
    procps-ng sysstat perf bcc-tools numactl numad \
    systemtap systemtap-server systemtap-client \
    intel-cmt-cat valgrind kernel-tools \
    mtr tcpdump uperf traceroute less tree nginx \
    qperf git iputils nmap  \
    wget curl iperf3 iproute ethtool \
    telnet ftp rsync socat httpd-tools \
    mysql postgresql jq python36 && \
    dnf -y update && \
    dnf clean all && \
    rm -rf /var/cache/dnf

RUN pip3 install yq

LABEL   io.k8s.display-name="Network Tools" \
        io.k8s.description="Container with networking tools for tests" \
        io.openshift.tags="nettools"

ENTRYPOINT /bin/bash -c "sleep infinity"
