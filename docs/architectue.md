🏗️ Infra Overview

You’re using a modular Kubernetes setup meant for local development and experimentation. Services are logically grouped, with the option to plug in components (like monitoring or GitOps tools) as you grow.

Cluster: Docker Desktop Kubernetes

Ingress: Traefik

Networking: /etc/hosts based DNS for local domains like traefik.lab.local

App Management: Kustomize overlays

Secrets/Certs: Handled manually for now, can integrate cert-manager later