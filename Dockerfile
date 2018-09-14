# syzoj-docker
FROM debian:stable

COPY config.json /etc/v2ray/config.json

RUN apt update &&\
    apt upgrade -y &&\
    apt install git nodejs&&\
    git clone https://github.com/syzoj/syzoj &&\
    cd syzoj &&\
    npm install
    

ENV PATH /usr/bin/v2ray:$PATH
USER v2ray
ENV USER=v2ray

EXPOSE 8080

CMD cp /etc/v2ray/config.json /tmp/config.json && \
    sed -i "s/b831381d-6324-4d53-ad4f-8cda48b30811/${ID}/g" /tmp/config.json && \
    v2ray -config=/tmp/config.json
