📡 Purpose

Traefik is your edge router (ingress controller) for routing HTTP/S traffic to services running inside your cluster.

⚙️ Setup Details

Installed via Helm

Values defined in helm-values/traefik/values.yaml

Dashboard exposed at https://traefik.lab.local

Auth middleware configured to guard the dashboard

🧪 Debugging Tips

Use kubectl port-forward -n traefik svc/traefik 9000:9000 for dashboard testing

IngressRoutes need to match defined entrypoints (like websecure)

Logs are your best friend: kubectl logs -n traefik -l app.kubernetes.io/name=traefik