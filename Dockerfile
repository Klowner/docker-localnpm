FROM iron/node:4.2.3
MAINTAINER Mark Riedesel <mark@klowner.com>

WORKDIR /app
ADD . /app/

EXPOSE 5080
VOLUME ["/data"]

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["app:start"]
