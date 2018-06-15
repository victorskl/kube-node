# dockerd daemon config

- https://docs.docker.com/config/daemon/
- https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file


To modify the Cgroup driver to `systemd`. Default is `cgroupfs`.

```
"exec-opts": ["native.cgroupdriver=systemd"]
```