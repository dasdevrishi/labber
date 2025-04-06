#!/bin/bash
set -e

echo "Destroying old cluster (if exists)..."
k3d cluster delete homelab || true

echo "Creating new k3d cluster..."
k3d cluster create --config cluster/k3d/cluster-config.yaml

echo "Cluster created! Current nodes:"
kubectl get nodes