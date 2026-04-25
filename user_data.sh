#!/bin/bash
set -e

sudo apt update -y

# Install Java + Maven
sudo apt install openjdk-17-jdk -y
sudo apt install maven -y
sudo apt install git -y

# Clone your repo
cd /home/ubuntu
git clone https://github.com/gunnalaajay1234-maker/2-tier-java-studentregistration-using-terraform-automation-githubactions.git

# Build app
cd https://github.com/gunnalaajay1234-maker/2-tier-java-studentregistration-using-terraform-automation-githubactions.git/app
mvn clean package

# Run app
java -jar target/*.jar > app.log 2>&1 &