#!/bin/bash

set -e

NAMESPACE="traefik"
RELEASE_NAME="traefik"
VALUES_FILE="helm-values/traefik/values.yaml"
MIDDLEWARE_FILE="infra/ingress/traefik/middleware.yaml"
DASHBOARD_FILE="infra/ingress/traefik/dashboard.yaml"
DASHBOARD_HOST="traefik.local.lab"

echo "Setting up Traefik..."

# Step 1: Create namespace if it doesn't exist
kubectl get namespace $NAMESPACE >/dev/null 2>&1 || {
  echo "Creating namespace $NAMESPACE..."
  kubectl create namespace $NAMESPACE
}

# Step 2: Install or upgrade Traefik via Helm
echo "Installing/upgrading Traefik via Helm..."
helm upgrade --install $RELEASE_NAME traefik/traefik \
  --namespace $NAMESPACE \
  -f $VALUES_FILE

# Step 3: Apply middleware
echo "Applying middleware config..."
kubectl apply -f $MIDDLEWARE_FILE

# Step 4: Apply dashboard ingress
echo "Applying dashboard ingress..."
kubectl apply -f $DASHBOARD_FILE

# Step 5: Add /etc/hosts entry if missing
if ! grep -q "$DASHBOARD_HOST" /etc/hosts; then
  echo "Adding $DASHBOARD_HOST to /etc/hosts..."
  echo "127.0.0.1 $DASHBOARD_HOST" | sudo tee -a /etc/hosts >/dev/null
else
  echo "$DASHBOARD_HOST already exists in /etc/hosts"
fi

# Final message
echo ""
echo "Traefik setup complete!"
echo "Access the dashboard at: https://$DASHBOARD_HOST/dashboard/"
echo "Or port-forward with:"
echo "kubectl port-forward -n traefik svc/traefik 9000:9000"