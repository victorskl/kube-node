# centos

### Development

For local development and testing, you can use a simple cluster as follows:

```
git clone https://github.com/victorskl/vagrant-tute.git
cd 01-simple-cluster && vagrant up
ssh vagrant@172.16.10.10
ssh vagrant@172.16.10.11
ssh vagrant@172.16.10.12
```

If you are new to Ansible and Vagrant, exercise these tutorials:
- https://github.com/victorskl/ansible-tute
- https://github.com/victorskl/vagrant-tute

### Deployment

Using Ansible to prepare CentOS based Kubernetes and/or Docker node that is ready to join/form a cluster.

- pre-deploy setup
    ```
    cd centos
    
    cp ansible.cfg.sample ansible.cfg
    cp hosts.ini.sample hosts.ini
    
    ansible -v all -m ping
    ansible master -m setup
    
    ansible -v all -a "yum update -y"
    ansible -v all -a "reboot"
    ```

- deploy docker nodes (skip if kubernetes)
    ```
    ansible-playbook -v docker-node.yml
    ```

- deploy proxy nodes
    ```
    ansible-playbook -v proxy-node.yml
    ```

- deploy kubernetes nodes
    ```
    ansible-playbook -v kube-node.yml
    
    (OR also set specific timezone)
    ansible-playbook -v -e "timezone=Australia/Melbourne" kube-node.yml
    ```

- observe deployment
    ```
    ansible -v all -a "date"
    ansible -v all -a "cat /etc/hosts"
    ansible -v all -a "cat /etc/resolv.conf"
    ansible -v all -a "cat /proc/swaps"
    ansible -v all -a "grep swap /etc/fstab"
    ansible -v all -a "docker info" | grep Cgroup
    ```

### Configure kubernetes cluster

The playbook `kube-node.yml` install docker, kubeadm and related components as described in [installing kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/).

- Follow up to complete the kubernetes cluster as described in:
    - https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/

- On master node
    ```
    ssh vagrant@172.16.10.10
    sudo kubeadm init --apiserver-advertise-address=172.16.10.10 --pod-network-cidr=10.244.0.0/16
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config
    kubectl get all
    kubectl version
    kubectl cluster-info
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
    kubectl get all -n kube-system -o wide
    ```

- On each worker node
    ```
    ssh vagrant@172.16.10.11
    sudo kubeadm join 172.16.10.10:6443 --token uw02rd.vmrjirf61x6mvtl3 --discovery-token-ca-cert-hash sha256:27851744a2b3285838396d69bad5943050b5ad83bd862c638c2e994c9123d536
    ```
 
 - On master node
    ```
    [vagrant@master ~]$ kubectl get nodes
    NAME     STATUS     ROLES    AGE   VERSION
    master   Ready      master   11m   v1.14.2
    node1    Ready      <none>   50s   v1.14.2
    node2    NotReady   <none>   22s   v1.14.2
    ```
