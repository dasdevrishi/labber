🔧 About

This repository holds the configuration for your homelab Kubernetes setup. You’re running a local cluster with Docker Desktop (using the built-in Kubernetes), managing apps via Helm, Kustomize, and GitOps principles.

🚀 Stack

Kubernetes: Local cluster via Docker Desktop

Traefik: Ingress controller

Helm: Package manager

ArgoCD (Planned): GitOps CD tool

Kustomize: Declarative overlays

Fluent Bit, Prometheus, Grafana (Planned): Monitoring stack

🗺️ Structure

apps/: Application manifests via Kustomize

cluster/: Cluster-level configs (k3d, ArgoCD, etc.)

helm-values/: Centralized Helm values

infra/: Infra-specific manifests (ingress, certs, etc.)

monitoring/: Stack for observability

scripts/: Bootstrap and teardown helpers

docs/: This directory 🧠

🛠️ Getting Started

# Spin up cluster (if using k3d)
./scripts/bootstrap.sh

# Deploy apps
kubectl apply -k apps/overlays/local

