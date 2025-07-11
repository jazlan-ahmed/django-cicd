#!/bin/bash

# Update and install dependencies
sudo apt update
sudo apt install -y fontconfig openjdk-17-jre wget gnupg curl

# Add Jenkins GPG key and repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
sudo apt update
sudo apt install -y jenkins

# Enable and start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Show Jenkins status
sudo systemctl status jenkins

# Print Jenkins initial admin password
echo -e "\nJenkins installed. Use this password to unlock Jenkins on first login:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Optional: Open port 8080 in UFW (if using UFW)
# sudo ufw allow 8080

echo -e "\nAccess Jenkins at: http://your-ec2-public-ip:8080"

