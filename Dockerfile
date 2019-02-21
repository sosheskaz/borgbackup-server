FROM alpine:3.9

RUN apk update && \
    apk add --virtual build-dependencies gcc linux-headers musl-dev libressl-dev python3-dev acl-dev && \
    apk add libressl libacl openssh-server python3 py3-pip && \
    python3 -m pip install borgbackup && \
    apk del build-dependencies && \
    rm /var/cache/apk/*
