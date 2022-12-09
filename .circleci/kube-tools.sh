#!/bin/sh
mkdir -p /tmp/tools
cd /tmp/tools

# Check if kubectl in tools folder
if [ -f "/tmp/tools/kubectl" ]; then
    echo "kubectl already installed"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
else
    echo "Installing kubectl"
    sudo curl -LO "https://dl.k8s.io/release/v1.23.0/bin/linux/arm64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
fi

# Check if yq in tools folder
if [ -f "/tmp/tools/yq" ]; then
    echo "yq already installed"
    chmod +x /tmp/tools/yq && sudo mv /tmp/tools/yq /usr/bin/yq
else
    echo "Installing yq"
    wget https://github.com/mikefarah/yq/releases/download/v4.16.2/yq_linux_arm64 -O /tmp/tools/yq
    chmod +x /tmp/tools/yq && sudo mv /tmp/tools/yq /usr/bin/yq
fi

# Check if helm in tools folder
if [ -f "/tmp/tools/helm" ]; then
    echo "helm already installed"
    chmod +x /tmp/tools/helm && sudo mv /tmp/tools/helm /usr/local/bin/helm
else
    echo "Installing helm"
    curl -LO https://get.helm.sh/helm-v3.7.2-linux-arm64.tar.gz
    tar -zxvf /tmp/tools/helm-v3.7.2-linux-arm64.tar.gz
    sudo mv /tmp/tools/linux-arm64/helm /tmp/tools/helm
    sudo mv /tmp/tools/helm /usr/local/bin/helm
fi