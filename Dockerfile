# syzoj-docker
FROM debian:stable

RUN apt update &&\
    apt upgrade -y &&\
    apt install git curl gnupg gnupg2 -y &&\
    curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
    apt install -y nodejs &&\
    git clone https://github.com/syzoj/syzoj &&\
    cd syzoj &&\
    npm install
    
USER judge
ENV USER=judge

EXPOSE 8080

CMD cd syzoj &&\
    npm start
