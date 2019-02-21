FROM alpine:3.9

RUN apk update && \
    apk add --virtual build-dependencies gcc linux-headers musl-dev openssl-dev python3-dev acl-dev && \
    apk add libacl openssh-server python3 py3-pip && \
    python3 -m pip install borgbackup && \
    apk del build-dependencies && \
    rm /var/cache/apk/*

ADD borgserver-startup.sh /bin/borgserver-startup.sh

HEALTHCHECK CMD [ "nc", "127.0.0.1", "22" ]

ENTRYPOINT [ "borgserver-startup.sh" ]
