FROM iron/node:latest
MAINTAINER Mark Riedesel <mark@klowner.com>

WORKDIR /app
ADD . /app/

EXPOSE 5080
VOLUME ["/data"]

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["app:start"]
