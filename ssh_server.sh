# Update package
apt-get -y update

# Install openssh-server
apt-get install -y openssh-server

# Change ssh config
chmod +x ./scripts/update_ssh_config.sh

# Start ssh service
service --status-all
service ssh start
service --status-all

# Change root password 
chmod +x ./scripts/update_ssh_config.sh

# Install net-tools
apt-get install net-tools

# Echo IP address
ifconfig
