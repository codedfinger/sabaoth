#!/bin/bash

# Define the target EC2 instance and subnet details
INSTANCE_IP="$EC2_INSTANCE_IP_APP"  # Replace with the IP address of your EC2 instance
SSH_KEY="$PATH_TO_SSH_KEY"  # Replace with the path to your SSH key file
SUBNET_ID="$SUBNET_ID"  # Replace with the ID of the subnet where your EC2 instance resides

# Copy the built files to the EC2 instance
scp -o StrictHostKeyChecking=no -i "$SSH_KEY" -r backend/* ubuntu@"$INSTANCE_IP":/home/ubuntu/backend

# Connect to the EC2 instance and restart the Express app
ssh -o StrictHostKeyChecking=no -i "$SSH_KEY" ec2-user@"$INSTANCE_IP" "cd /home/ubuntu/backend && npm install && pm2 start index.js"

EOF
