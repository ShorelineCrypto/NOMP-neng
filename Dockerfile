FROM ryanshaw/node-open-mining-portal:latest

WORKDIR /opt/node-open-mining-portal

VOLUME ["/opt/config"]

EXPOSE 80
EXPOSE 3333

CMD node init.js
