🧱 Layering Approach

You follow a two-tiered Kustomize structure:

apps/base/: Shared manifests

apps/overlays/local/: Local dev overrides

This allows easy expansion (e.g. apps/overlays/prod/ for a real environment).

📦 Helm vs Kustomize

Use Helm for third-party apps (Traefik, ArgoCD, etc.)

Use Kustomize for your own apps or additional patching logic

🧠 Namespaces

traefik: For ingress controller

argocd: For GitOps (planned)

Add per-service namespaces as you scale (e.g. monitoring, storage)

