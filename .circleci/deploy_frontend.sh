#!/bin/bash

# Define the target EC2 instance and subnet details
INSTANCE_IP="$EC2_INSTANCE_IP_WEB"  # Replace with the IP address of your EC2 instance
SSH_KEY="$PATH_TO_SSH_KEY"  # Replace with the path to your SSH key file
SUBNET_ID="$SUBNET_ID"  # Replace with the ID of the subnet where your EC2 instance resides

# Copy the built files to the EC2 instance
ssh -o StrictHostKeyChecking=no -i "$SSH_KEY" ubuntu@"$INSTANCE_IP" "sudo mkdir -p /var/www/html"

# Connect to the EC2 instance and restart the Express app
scp -o StrictHostKeyChecking=no -i "$SSH_KEY" -r frontend/build/* ubuntu@"$INSTANCE_IP":/var/www/html/