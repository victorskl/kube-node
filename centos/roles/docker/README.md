# docker 

### version

- Set docker version to use.

```
docker_version: 18.09.1
```

### daemon config

- Set to `true` or `false` for whether to configure docker daemon service. Default is `false`.

```
docker_config_daemon: true
```

REF

- https://kubernetes.io/docs/setup/cri/
- https://docs.docker.com/config/daemon/
- https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-configuration-file


To modify the Cgroup driver to `systemd`. Default is `cgroupfs`.

```
"exec-opts": ["native.cgroupdriver=systemd"]
```
