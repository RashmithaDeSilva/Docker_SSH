# Use a base image with the common dependencies
FROM ubuntu:latest as base

# Update package
RUN apt-get -y update 


# Build image 1 ---------------------------------
FROM base as ubuntu_ssh_server

# Create a setup directory
# RUN mkdir /setup
# RUN cd /setup

# Update package
RUN apt-get -y update

# Install openssh-server
RUN apt-get install -y openssh-server

# Start ssh service
# RUN service ssh start

# Install net-tools
RUN apt-get install net-tools

# Copy scripts and application files
# COPY ./scripts /setup/

# Change root password
RUN echo "root:12345" | chpasswd

# Update ssh config
RUN sed -i.bak "s|#PermitRootLogin prohibit-password|PermitRootLogin yes|" "/etc/ssh/ssh_config"

# Make the script executable and run it during build
# RUN chmod +x /setup/change_root_password.sh && \ 
#     /bin/bash /setup/change_root_password.sh 
    
# RUN chmod +x /setup/update_ssh_config.sh && \
#     /bin/bash /setup/update_ssh_config.sh

# Echo IP address and server status
CMD ["/bin/bash", "-c", "service ssh start && ifconfig && service --status-all && echo 'root password' bash"]


# Build image 2 ---------------------------------
FROM base as ubuntu_ssh_client

# Create a working directory
# WORKDIR /working_dir

# Update package
RUN apt-get -y update

# Install openssh-client
RUN apt-get install -y openssh-client

# Install net-tools
RUN apt-get install net-tools

# Echo IP address
CMD ["/bin/bash", "-c", "ifconfig && bash"]


# Set the default image to build
FROM ubuntu_ssh_server




