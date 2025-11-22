# minecraft-hot-cold-switcher

⚠️ Status: WORK IN PROGRESS — NOT READY FOR PRODUCTION USE
This project is currently under active development.
Some features may be incomplete, unstable, or missing entirely.
Feel free to explore, contribute, or follow the progress — but do not expect a fully working setup yet.

Automatically switch a Minecraft server on and off in Google Cloud to save costs.
This repository aims to provide Terraform infrastructure, optional helper scripts, and a GitHub Actions CI/CD workflow that manages the lifecycle of a GCP VM instance running a Minecraft server.

Hot–Cold Switching
Instead of keeping the instance running 24/7, the server can run only during scheduled “hot” windows or be started manually through API/CI while staying “cold” (stopped) the rest of the time.
This reduces cost while preserving the full server world and configuration.

✨ Planned Features:
* Google Cloud support (initial target)
* Terraform-managed infrastructure
  * VM instance
  * Firewall rules
  * Service accounts
  * Startup scripts
  * (Optional) GCP budgets
* Cost-saving hot/cold switching
* Manual or scheduled auto-start
* GitHub Actions CI/CD
* Interactive setup script (optional)
* Future provider support
  * AWS
  * Hetzner
  * Others (via modules)


🚀 Quick Start (NOT FINALIZED)

These instructions will change as the project evolves.

1. Prerequisites

Google Cloud account

A GCP project with billing enabled

Terraform

GitHub repository (optional)

2. Clone
```bash
git clone https://github.com/<yourname>/minecraft-hotcold-switcher
cd minecraft-hotcold-switcher
```

3. Configure

Either use the (future) setup script:
```bash
./scripts/configure.sh
```
Or manually edit Terraform variables.

⚠️ The setup script is not implemented yet.

4. Deploy
```bash
cd terraform
terraform init
terraform apply
```
⚠️ The infrastructure is not complet






