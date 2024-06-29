FROM node:20.15.0-slim

MAINTAINER mbw328P <mbw.mega328p@gmail.com>

LABEL maintainer="mbw.mega328p@gmail.com"
LABEL repository="https://github.com/MengBowen-328p/Hexo_Docker"
LABEL homepage="xxxxxxx"

# Set the server port as an environmental
ENV HEXO_SERVER_PORT=4000

# Set the git username and email
ENV GIT_USER="MengBowen-328p"
ENV GIT_EMAIL="mbw.mega328p@gmail.com"

# Install requirements
RUN apt-get update && \
    apt-get install -y --no-install-recommends git git-lfs curl gpg vim net-tools lsof procps locales ca-certificates openssl openssh-client jq && \
    locale-gen zh_CN && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
    apt-get install -y --no-install-recommends yarn nasm && \
    yarn global add gulp && \
    npm config set registry https://registry.npmmirror.com && \
    npm install -g pm2 nrm npm-check && \
    npm install -g hexo-cli && \
    npm install -g cnpm --registry=https://registry.npmmirror.com && \
    apt-get clean && \
    yarn cache clean && \
    npm cache clean --force

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    apt-get update && \
    apt-get -y \
        install \
        --no-install-recommends \
        wget \
        dos2unix \
        build-essential \
        autoconf \
        automake \
        gettext \
        libtool \
        pkg-config \
        gettext \
        libpng-dev \
        gh && \
    apt-get clean


ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# Set workdir
WORKDIR /app

# Expose Server Port
EXPOSE ${HEXO_SERVER_PORT}

#Copy Scripts
COPY ./Scripts/entrypoint.sh /entrypoint.sh
COPY ./Scripts/userRun.sh /userRun.sh
COPY ./Scripts/hexo_run.js /hexo_run.js

RUN chmod +x /*.sh

ENTRYPOINT ["/entrypoint.sh"]