#!/bin/sh
sudo apt -y update
sudo apt -y install curl wget vim git zsh build-essential ca-certificates gnupg lsb-release net-tools network-manager
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io python-is-python3 pip docker-compose
sudo pip install --ignore-installed ansible

git clone https://github.com/badsaarow/ansible-osx-setup.git
cd ansible-osx-setup || exit

ansible-galaxy install -r requirements.yml
sudo apt -y upgrade
curl -fsSL https://tailscale.com/install.sh | sh
curl -s https://install.zerotier.com | sh
sudo reboot
