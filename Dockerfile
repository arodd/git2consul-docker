FROM centos:latest
MAINTAINER Austin Workman <austin@arodd.com>

ADD nodejs.repo /etc/yum.repos.d/nodejs.repo
ADD NODESOURCE-GPG-SIGNING-KEY-EL /etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL
RUN yum install -y nodejs git openssh-clients
RUN npm install git2consul --global

EXPOSE 5252/tcp
CMD ["-e", "consul.service.consul"]
ENTRYPOINT ["/bin/node","/usr/lib/node_modules/git2consul","-h"]
