cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum  install kubeadm docker -y
systemctl restart docker && systemctl enable docker
kubeadm join --token 7db980.7974b97292c58e6a 10.10.0.131:6443 --discovery-token-ca-cert-hash sha256:0f3cd617e50f1a6b743daae68dfeed828ba7a04812a65b2256e671b63f6bc7a8
