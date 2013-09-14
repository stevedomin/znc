# znc
#
# VERSION               0.1.0
# DOCKER-VERSION        0.6.1

FROM       ubuntu:12.04
MAINTAINER Steve Domin "steve@stevedomin.com"

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise-backports universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y znc/precise-backports znc-dbg/precise-backports znc-dev/precise-backports znc-extra/precise-backports znc-perl/precise-backports znc-python/precise-backports znc-tcl/precise-backports && apt-get clean

RUN useradd znc
ADD . /src
RUN cd /src && chmod +x run-znc && cp run-znc /usr/local/bin/

USER znc
EXPOSE 6660
CMD run-znc
