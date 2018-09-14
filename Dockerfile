# syzoj-docker
FROM debian:stable

RUN apt update &&\
    apt upgrade -y &&\
    apt install git nodejs -y &&\
    git clone https://github.com/syzoj/syzoj &&\
    cd syzoj &&\
    npm install
    
USER judge
ENV USER=judge

EXPOSE 8080

CMD cd syzoj &&\
    npm start
