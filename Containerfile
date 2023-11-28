# podman build -t quay.io/wcaban/net-toolbox -f Containerfile
# podman tag quay.io/wcaban/net-toolbox:latest quay.io/wcaban/net-toolbox:$(date +%y%m%d)
#FROM registry.access.redhat.com/ubi9/ubi
FROM quay.io/centos/centos:stream9

#Install EPEL Repo
RUN dnf install --setopt=tsflags=nodocs -y \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    && dnf -y update


# NOTE: Using the UBI image with some of these packages requires
# building on a RHEL node with valid subscriptions
# tcpflow rt-test
RUN dnf install --setopt=tsflags=nodocs -y \
    #--enablerepo baseos \
    --enablerepo appstream \
    #--enablerepo crb \ 
    #--enablerepo highavailability \
    #--enablerepo nfv \
    --enablerepo rt \
    rteval rteval-loads \
    iproute bind-utils iputils iperf3 lksctp-tools net-tools \
    frr iptables libreswan \
    nload \
    procps-ng sysstat perf bcc-tools numactl numad \
    systemtap systemtap-server systemtap-client \
    intel-cmt-cat valgrind kernel-tools \
    mtr tcpdump uperf traceroute less tree nginx \
    qperf git nmap  \
    wget iproute ethtool \
    telnet ftp rsync socat httpd-tools \
    bcc-tools bpftrace xdp-tools bpftool \
    mysql postgresql jq python python-pip \
    && dnf clean all \
    && rm -rf /var/cache/dnf \
    && python -m pip install yq --no-cache-dir

LABEL   io.k8s.display-name="Network Tools" \
        io.k8s.description="Container with networking tools for tests" \
        io.openshift.tags="nettools"

ENTRYPOINT /bin/bash -c "sleep infinity"
