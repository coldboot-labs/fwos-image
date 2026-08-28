FROM quay.io/fedora/fedora-bootc:44

COPY overlay/usr/ /usr/

RUN ostree container commit
