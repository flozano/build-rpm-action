FROM centos:7

RUN yum groupinstall -y "Development Tools" && \
    yum install -y \
        kernel-devel \
        kernel-headers

ENV PATH /usr/local/go/bin:$PATH
RUN curl https://go.dev/dl/go1.19.5.linux-amd64.tar.gz --output /tmp/go.tar.gz --silent -L
RUN tar -C /usr/local -xzf /tmp/go.tar.gz
COPY template.spec /
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
