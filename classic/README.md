# classic

___SHOULD USE CENTOS OR DEBIAN___

_this left here just historical reference purpose for classic style of writing ansible; prior roles, galaxy era, etc..._

---

Bootstrap Kubernetes node using Ansible

```
bash setup.sh hosts.ini ubuntu ~/.ssh/id_rsa playbooks/kube-node.yaml
```

### swapfile

- check to make sure swapfile are commented to disable swap support

```
ansible -i hosts.ini -u ubuntu kube-nodes -a 'grep swap /etc/fstab'
```
