FROM localhost/fwos-fwd-setup:dev AS fwd-setup
FROM localhost/fwos-netd:dev AS netd
FROM localhost/fwos-cli:dev AS cli
FROM localhost/fwos-ui:dev AS ui
FROM localhost/fwos-kea:dev AS kea
FROM localhost/fwos-unbound:dev AS unbound
FROM quay.io/fedora/fedora-bootc:44

COPY --from=fwd-setup /usr/bin/fwos-fwd-setup /usr/bin/fwos-fwd-setup
COPY --from=fwd-setup /usr/bin/fwos /usr/bin/fwos
COPY --from=netd / /usr/lib/fwos/addons/netd
COPY --from=cli / /usr/lib/fwos/addons/cli
COPY --from=ui / /usr/lib/fwos/addons/ui
COPY --from=kea / /usr/lib/fwos/addons/kea
COPY --from=unbound / /usr/lib/fwos/addons/unbound
COPY overlay/usr/ /usr/

RUN chmod 755 /usr/bin/fwos-fwd-setup \
    && chmod 755 /usr/bin/fwos \
    && chmod 755 /usr/lib/fwos/addons/netd/usr/bin/netd \
    && chmod 755 /usr/lib/fwos/addons/cli/usr/bin/fwos \
    && chmod 755 /usr/lib/fwos/addons/ui/usr/bin/fwos-ui \
    && chmod 755 /usr/libexec/fwos-ui-mgmt-wait /usr/libexec/fwos-apply-hostname /usr/libexec/fwos-lan-services-wait \
    && chmod 755 /usr/libexec/fwos-sshd-mgmt /usr/libexec/fwos-sshd-mgmt-wait \
    && printf '%%wheel ALL=(root) NOPASSWD: /usr/sbin/ip, /usr/bin/ip, /usr/bin/nsenter\n' > /etc/sudoers.d/fwos-ip \
    && chmod 440 /etc/sudoers.d/fwos-ip \
    && ostree container commit
