!#/bin/bash
#install kubectl
sudo curl -LO "https://dl.k8s.io/release/v1.23.0/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install yq
wget https://github.com/mikefarah/yq/releases/download/v4.16.2/yq_linux_arm64 -O /tmp/yq
chmod +x /tmp/yq && sudo mv /tmp/yq /usr/bin/yq

# install helm
cd /tmp && curl -LO https://get.helm.sh/helm-v3.7.2-linux-arm64.tar.gz
tar -zxvf helm-v3.7.2-linux-arm64.tar.gz
sudo mv linux-arm64/helm /usr/local/bin/helm