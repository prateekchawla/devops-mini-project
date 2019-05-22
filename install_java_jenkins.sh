#!/bin/bash
sudo apt-get update -y
sudo apt-get upgade -y
sudo apt-get install openjdk-8-jdk -y
java -version

sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
sudo ufw allow 8080
