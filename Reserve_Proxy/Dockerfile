FROM ubuntu:20.04
MAINTAINER mbw328P <mbw.mega328p@gmail.com>

LABEL maintainer="mbw.mega328p@gmail.com"
LABEL repository="https://github.com/MengBowen-328p/Hexo_Docker"

# Set the git username and email
ENV GIT_USER="MengBowen-328p"
ENV GIT_EMAIL="mbw.mega328p@gmail.com"
# Set language env
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# Install requirements

RUN apt-get update && \
    apt-get install -y --no-install-recommends unzip wget git git-lfs curl gpg vim net-tools lsof procps locales ca-certificates openssl openssh-client jq systemd && \
    locale-gen zh_CN && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
    apt-get clean


WORKDIR /app

COPY ./Scripts/entrypoint.sh /entrypoint.sh
COPY ./Configs/config.json  /config.json


RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]