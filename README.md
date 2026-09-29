# fwos-image

Host image: Fedora bootc remix plus overlay and branding. Not Workstation tooling, not crate sources, not addon recipes.

```
Containerfile          # FROM fedora-bootc, overlay, ostree commit, embedded netd rootfs
overlay/usr/           # os-release branding, Quadlets, tmpfiles, Appliance console tty drop-ins, Host update, appliance-health, and rollback network-restore units
bib.toml               # published Disk image customizations (no users, no SSH key)
installer.toml         # Installer kickstart (typed yes before wipe; Host disk layout)
```

Build the container with Workstation tooling (`fwos-dev`), not by installing onto a Workstation disk.

VGA and serial run the Appliance console Host program (`/usr/bin/fwos-console`, built from `fwos-src`) instead of a login: the Bootstrap console before ownership, then the limited authenticated recovery menu. The Host image ships no Host shell login, no network SSH, and no full Appliance CLI (deferred to v2); routine configuration and Host update are in the UI.
