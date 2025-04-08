🚀 Lab Environment: Reflection & Progress Summary

✅ What We’ve Built So Far

💻 Local Lab Environment

K3d-based local Kubernetes cluster

Structured folder hierarchy for clean separation:

apps/ — GitOps-managed applications (ArgoCD, etc.)

infra/ — Infrastructure manifests (IngressRoutes, Middleware, etc.)

cluster/ — (TBD) Cluster-wide configuration

🌀 Traefik Setup

Installed using Helm with custom values

Exposed dashboard via IngressRoute

Configured entryPoints and secured routes with Middleware (basicAuth)

Script created for port-forwarding and /etc/hosts setup

🚀 ArgoCD Setup

Installed via Helm (simple initial setup)

Logged into the ArgoCD UI successfully

Enabled GitOps using a self-managed ArgoCD application:

apps/argocd/base/ — Base manifests

apps/argocd/overlays/local/ — Local-specific patches (e.g. namespace)

argocd-app.yaml — ArgoCD application manifest

🧠 What We’ve Learned

🧩 Kustomize

base directory contains reusable app manifests

overlays contain environment-specific customizations (e.g. local, prod)

kustomization.yaml acts as an orchestrator for applying resources and patches

Supports modular, flexible design without duplication

⚓ Helm

Helm used for chart deployment with custom values.yaml

Clarified how port exposure works (entryPoints, ports, services)

Learned how Helm and Kustomize can be used together effectively

🔁 GitOps via ArgoCD

ArgoCD watches a Git repo and syncs manifests automatically

Implemented the GitOps pattern with ArgoCD managing itself

📌 Challenges (And Wins)

❌ IngressRoute dashboard showed 404 — resolved by exposing correct ports and applying middleware

❌ Helm values schema mismatch — fixed by correcting values.yaml structure

❌ Middleware errors — resolved by ensuring correct CRD and versioning

❌ Manual patching confusion — solved by understanding the Kustomize structure

📈 What’s Next

Monitoring Stack

Deploy Prometheus/Grafana stack using Helm

Add under GitOps using the same base/overlay model

Database Setup

Deploy Postgres using Helm (e.g. Bitnami chart)

Include PVCs, Services, and HelmRelease or Kustomize manifests

Secrets Management

Explore SealedSecrets, ExternalSecrets, or native secrets

Migrate Traefik to GitOps

Move current manually deployed Traefik setup into GitOps control

Health Checks & Observability

Add liveness/readiness probes, monitoring dashboards, and alerting

Documentation & Scripts

Convert all learnings into repeatable scripts and markdown files

Continue growing docs/ with setup guides and best practices

This journey is already becoming a solid foundation for a real-world GitOps lab setup. The flexibility of Kustomize, the power of Helm, and the visibility of ArgoCD are all coming together beautifully!

