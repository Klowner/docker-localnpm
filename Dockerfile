FROM iron/node:4.2.3
MAINTAINER Mark Riedesel <mark@klowner.com>

WORKDIR /app
ADD . /app/

EXPOSE 5080
VOLUME ["/data"]

#ENV PORT=5080
#ENV URL_BASE=http://172.0.0.1:5080
#ENV POUCH_PORT=16984
#ENV POUCH_LOG=warn
#ENV REMOTE=https://registry.npmjs.org
#ENV REMOTE_SKIM=https://skimdb.npmjs.com/registry
#ENV DIRECTORY=/data

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["app:start"]
