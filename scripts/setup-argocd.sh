#!/bin/bash

set -e

NAMESPACE="argocd"
OVERLAY_PATH="apps/argocd/overlays/local"

echo "Setting up ArgoCD..."

# Step 1: Create namespace if it doesn't exist
kubectl get namespace $NAMESPACE >/dev/null 2>&1 || {
  echo "Creating namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
}

# Step 2: Apply the Kustomize overlay
echo "Applying ArgoCD overlay using Kustomize..."
kubectl apply -k $OVERLAY_PATH

echo "Waiting for ArgoCD server to be ready..."
kubectl rollout status deployment argocd-server -n $NAMESPACE

# Step 3: Port-forward for dashboard access
echo ""
echo "ArgoCD setup complete!"
echo "Access the ArgoCD UI at: https://localhost:8080"
echo "Run this to port-forward:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"