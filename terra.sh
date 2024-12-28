#!/bin/sh

cd /home/ubuntu/mario_game_action/k8s-mario/EKS-TF/
terraform init
terraform validate
terrafrom plan
terraform apply -auto-approve