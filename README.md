# kube-node

Bootstrap Kubernetes node using Ansible

```
bash setup.sh hosts.ini ubuntu ~/.ssh/id_rsa playbooks/kube-node.yaml
```

### swapfile

- check to make sure swapfile are commented to disable swap support

```
ansible -i hosts.ini -u ubuntu kube-nodes -a 'grep swap /etc/fstab'
```

