# centos

Using Ansible to prepare CentOS based Kubernetes and/or Docker node that is ready to join/form a cluster.

```
cp ansible.cfg.sample ansible.cfg
cp hosts.ini.sample hosts.ini

ansible -v all -m ping
ansible master -m setup

ansible -v all -a "yum update -y"
ansible -v all -a "reboot"

ansible-playbook -v docker-node.yml
ansible-playbook -v kube-node.yml

ansible -v all -a "cat /etc/hosts"
ansible -v all -a "date"

ansible-playbook -v -e "timezone=Australia/Melbourne" kube-node.yml
ansible-playbook -v proxy-node.yml

ansible -v all -a "date"
ansible -v all -a "cat /etc/hosts"
ansible -v all -a "cat /etc/resolv.conf"
ansible -v all -a "cat /proc/swaps"
ansible -v all -a "grep swap /etc/fstab"
ansible -v all -a "docker info" | grep Cgroup
```
