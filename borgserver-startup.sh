#!/bin/sh -xe

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    echo "No RSA Host Key found - generating."
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
fi
if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
    echo "No ECDSA Host Key found - generating."
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
fi
if [ ! -f /etc/ssh/ssh_host_ed25519_key ]; then
    echo "No ED25519 Host Key found - generating."
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
fi

/usr/sbin/sshd

tail -f /dev/null
