FROM alpine:3.7

LABEL maintainer="Miguel Angel Falcón <miguelfalcon@nubentos.com>"

ARG BUILD_DATE

# Metadata
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

RUN apk add --update ca-certificates \
 && apk add docker \
 && apk add --update -t deps curl \
 && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \ 
 && mv ./kubectl /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/* \
 && mkdir /root/.kube

WORKDIR /root
