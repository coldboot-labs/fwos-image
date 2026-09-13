# fwos-image

Host image: Fedora bootc remix plus overlay and branding. Not Workstation tooling, not crate sources, not addon recipes.

```
Containerfile          # FROM fedora-bootc, overlay, ostree commit, embedded netd rootfs
overlay/usr/           # os-release branding, Quadlets, tmpfiles, Host update and appliance-health units
bib.toml               # published Disk image customizations (no users, no SSH key)
installer.toml         # Anaconda ISO kickstart (unattended except disk pick; always wipe)
```

Build the container with Workstation tooling (`fwos-dev`), not by installing onto a Workstation disk.
