#!/bin/bash

ssh_config_path="/etc/ssh/ssh_config"
line_to_change="#PermitRootLogin prohibit-password"
new_line="PermitRootLogin yes"

# Check if the file exists
if [ ! -e "$ssh_config_path" ]; then
    echo "Error: $ssh_config_path not found."
    exit 1
fi

# Check if the user has permission to read and write the file
if [ ! -w "$ssh_config_path" ] || [ ! -r "$ssh_config_path" ]; then
    echo "Error: Permission denied to read/write $ssh_config_path."
    exit 1
fi

# Perform the line replacement
sed -i.bak "s|$line_to_change|$new_line|" "$ssh_config_path"

echo "SSH config line replaced successfully."
