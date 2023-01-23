#!/bin/bash

# Ja va installation (Jenkins is build using Java language)
sudo yum install java-11-openjdk.x86_64 -y
java -version

# Adding the Jenkins repo and key into the yum repository for installation
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Installing jenkins
sudo yum install jenkins -y

# Starting and enabling jenkins service
sudo systemctl enable jenkins

sudo systemctl start jenkins

# Firewall setup for jenkins in centos
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
