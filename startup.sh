sudo apt update
sudo apt upgrade -y
sudo systemctl stop apparmor
sudo systemctl disable apparmor
sudo apt-get install apt-transport-https ca-certificates \
    curl gnupg-agent software-properties-common docker.io -y
