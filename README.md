# Borg Backup Server Dockerfile

This is a minimalist dockerfile for managing the software for a back-end server for use with borg backup.

It is based on alpine, and has two pieces of software installed:

1. [Borg Backup](https://borgbackup.readthedocs.io/en/stable/)
2. [OpenSSH](https://www.openssh.com/)

## Persistence

In addition to any data directories you'd like to perist, you should persist the /etc/ssh/ directory
in order to keep SSH configuration settings and host keys.

### SSH Users

Configuring and persisting users is an exercise left for the user. The suggested way is to use docker volumes/binding
for `/etc/passwd`, `/etc/shadow`, and `/home`, in addition to any other binds done for the purpose of
the actual backups, and using `docker exec` to generate those configurations.

Keep in mind that, when binding file systems from outside docker into this container, you need to
match the user/group IDs as appropriate to ensure users retain access.

Keys can be managed the same way, by modifying or persisting users' ~/.ssh/authorized_keys files.
