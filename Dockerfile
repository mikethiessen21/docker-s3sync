FROM debian:jessie
MAINTAINER Paul Wiggett <mrporcles@gmail.com>

ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" LC_ALL="C.UTF-8" LANG="en_US.UTF-8" LANGUAGE="en_US.UTF-8"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      cron python python-magic python-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli && \
  rm -rf /tmp/pip_build_root/

RUN mkdir -p /data
RUN mkdir -p /root/.aws

ADD run.sh /

ENTRYPOINT ["/run.sh"]
CMD ["start"]
