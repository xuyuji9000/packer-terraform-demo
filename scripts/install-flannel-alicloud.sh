#!/bin/bash

echo "127.0.0.1 $(hostname)" >> /etc/hosts

kubeadm init --pod-network-cidr=10.24.0.0/16

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint nodes --all node-role.kubernetes.io/master-

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel-aliyun.yml
