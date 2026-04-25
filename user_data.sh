#!/bin/bash
set -e

sudo apt update -y

# Install Java + Maven + Git
sudo apt install openjdk-17-jdk maven git -y

# Go to home
cd /home/ubuntu

# Clone repo
git clone https://github.com/gunnalaajay1234-maker/2-tier-java-studentregistration-using-terraform-automation-githubactions.git

# Enter repo folder (NOT URL)
cd 2-tier-java-studentregistration-using-terraform-automation-githubactions/app

# Build app
mvn clean package

# Run app
nohup java -jar target/*.jar > app.log 2>&1 &