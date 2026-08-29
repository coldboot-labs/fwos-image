FROM localhost/fwos-fwd-setup:dev AS fwd-setup
FROM localhost/fwos-netd:dev AS netd
FROM quay.io/fedora/fedora-bootc:44

COPY --from=fwd-setup /usr/bin/fwos-fwd-setup /usr/bin/fwos-fwd-setup
COPY --from=netd / /usr/lib/fwos/addons/netd
COPY overlay/usr/ /usr/

RUN chmod 755 /usr/bin/fwos-fwd-setup \
    && chmod 755 /usr/lib/fwos/addons/netd/usr/bin/netd \
    && printf '%%wheel ALL=(root) NOPASSWD: /usr/sbin/ip, /usr/bin/ip\n' > /etc/sudoers.d/fwos-ip \
    && chmod 440 /etc/sudoers.d/fwos-ip \
    && ostree container commit
