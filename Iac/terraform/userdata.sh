#!/bin/bash

 sudo apt-get update
 sudo apt-get install -y nginx

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Install Docker
sudo apt install -y docker.io

