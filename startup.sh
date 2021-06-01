sudo apt update
sudo apt upgrade -y
sudo systemctl stop apparmor
sudo systemctl disable apparmor
sudo apt-get install apt-transport-https ca-certificates \
    curl gnupg-agent software-properties-common docker.io -y
sudo apt install screen nano -y

curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh --also-install

curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-logging-agent-repo.sh --also-install



