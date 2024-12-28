#!/bin/bash
#Deploy K8s services
aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1
kubectl apply -f ~/mario_game_action/k8s-mario/deployment.yaml
kubectl apply -f ~/mario_game_action/k8s-mario/service.yaml
kubectl describe svc mario-service
echo "Installation completed successfully."