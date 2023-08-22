#!/bin/bash
# Description: Proxy Server Setup Script
# Author: Mark Horton
# ----------------------------------------------------------------------
# This script is used to install the required software and settings for
# the project. It is intended to be run on a fresh Ubuntu 22.04 server.
# ----------------------------------------------------------------------

# Update the system
apt update
apt upgrade -y

# Install the required software
apt install -y nginx

# Copy the nginx config file
cp nginx/nginx.conf /etc/nginx/nginx.conf

# Remove the nginx sites-available folder
rm -rf /etc/nginx/sites-available

# Copy the nginx sites-enabled config files
cp nginx/sites-enabled/* /etc/nginx/sites-enabled/

# Restart nginx
systemctl restart nginx

# Set default firewall policies
ufw default deny incoming
ufw default allow outgoing

# Allow SSH connections on public interface
ufw allow OpenSSH

# Allow all traffic on private interface
ufw allow in on eth1 to any

# Enable firewall
ufw enable -y
