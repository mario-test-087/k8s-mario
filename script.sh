#!/bin/bash
# Install Terraform
sudo apt install wget -y
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform -y

# Install kubectl
sudo apt update
sudo apt install curl -y
curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# Install AWS CLI 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
#yes | unzip awscliv2.zip
sudo ./aws/install

# Terrafrom 
cd /home/ubuntu/mario_game_action/k8s-mario/EKS-TF/
terraform init
terraform validate
terrafrom plan
terraform apply -auto-approve
aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1
kubectl apply -f ../deployment.yaml
kubectl apply -f ../service.yaml
kubectl describe svc mario-service
echo "Installation completed successfully."