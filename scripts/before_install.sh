#!/usr/bin/env bash

# clean codedeploy-agent files for a fresh install
sudo rm -rf /home/ubuntu/install


sudo apt-get update
sudo apt-get install -y wget

cd /home/ubuntu

wget https://aws-codedeploy-eu-north-1.s3.eu-north-1.amazonaws.com/latestv2/install

chmod +x ./install
sudo ./install auto

sudo systemctl enable codedeploy-agent
sudo systemctl restart codedeploy-agent
sudo systemctl status codedeploy-agent

# update os & install python3
sudo apt-get update
sudo apt-get install -y python3 python3-dev python3-pip python3-venv
pip install --user --upgrade virtualenv

# delete app
sudo rm -rf /home/ubuntu/django-aws_cicd
