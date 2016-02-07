FROM iron/node
MAINTAINER Mark Riedesel <mark@klowner.com>

WORKDIR /app
ADD . /app/

EXPOSE 5080
VOLUME ["/data"]

CMD ["./node_modules/.bin/local-npm", "-d /data"]
