FROM ryanshaw/node-open-mining-portal:latest

WORKDIR /opt/node-open-mining-portal
COPY ./coins/nengcoin.json /opt/node-open-mining-portal/coins/

VOLUME ["/opt/config"]

EXPOSE 80
EXPOSE 3333
EXPOSE 3334

CMD node init.js
