# ubuntu

Using Ansible to prepare Ubuntu based Kubernetes and/or Docker node that is ready to join/form a cluster.

```
cp ansible.cfg.sample ansible.cfg
cp hosts.ini.sample hosts.ini

ansible -v all -m ping
ansible master -m setup

ansible -v all -a "apt update"
ansible -v all -a "apt list --upgradable"
ansible -v all -a "apt-get -y upgrade"
ansible -v all -a "reboot"

ansible -v all -a "apt-cache madison docker-ce"

ansible-playbook -v docker-node.yml
ansible-playbook -v proxy-node.yml
```

### kube-node

```
ansible-playbook -v kube-node.yml

ansible -v all -a "cat /etc/hosts"
ansible -v all -a "date"

ansible-playbook -v -e "timezone=Australia/Melbourne" kube-node.yml

ansible -v all -a "date"
ansible -v all -a "cat /etc/hosts"
ansible -v all -a "cat /etc/resolv.conf"
ansible -v all -a "cat /proc/swaps"
ansible -v all -a "grep swap /etc/fstab"
ansible -v all -a "docker info" | grep Cgroup
```
