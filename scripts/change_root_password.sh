#!/bin/bash

# Check if the script is being run by a superuser
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Use the passwd command to change the root password
echo "Changing root password to 12345"
echo "root:12345" | chpasswd

# Check if the password change was successful
if [ $? -eq 0 ]; then
  echo "Root password changed successfully."
else
  echo "Failed to change root password."
fi