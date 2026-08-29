# fwos-image

Host image: Fedora bootc remix plus overlay and branding. Not Workstation tooling, not crate sources, not addon recipes.

```
Containerfile          # FROM fedora-bootc, overlay, ostree commit, embedded netd rootfs
overlay/usr/           # os-release branding, Quadlets, tmpfiles
```

Build the container with Workstation tooling (`fwos-dev`), not by installing onto a Workstation disk.
