# Hot → Cold Switch Workflow

This guide describes how to safely stop the Hot VM, attach the world disk to the Cold VM, and start the Minecraft modpack.

---

## Prerequisites

- Both Hot and Cold VMs exist in GCP (Terraform applied).  
- Persistent world disk (`minecraft-world`) exists.  
- Both VMs are in the same zone (`europe-west4-a`).  
- `gcloud` CLI installed and authenticated on your local machine.

---

## Step 1 — Stop the Hot VM

```bash
gcloud compute instances stop minecraft-hot --zone europe-west4-a
```
- Ensures the world disk is not attached to two VMs simultaneously.
- Wait until the VM fully stops before proceeding.

## Step 2 — Attach the world disk to the Cold VM

```bash
gcloud compute instances attach-disk minecraft-cold \
  --disk minecraft-world \
  --zone europe-west4-a
```
- Attach in READ_WRITE mode.
- Makes the same persistent world available to the Cold VM.

## Step 3 — Install Minecraft Modpack on the Cold VM

1. SSH into the Cold VM:
```bash
gcloud compute ssh minecraft-cold --zone europe-west4-a
```

2. Update packages and install Java:
```bash
sudo apt update
sudo apt install -y openjdk-17-jre-headless screen wget unzip
```

3. Download and install minecraft server:
```bash
mkdir -p ~/minecraft-server
cd ~/minecraft-server

# Replace with actual modpack download link
wget <ATM10_SERVER_ZIP_URL>
unzip <ATM10_SERVER_ZIP_FILE>
```

4. Mount the world disk and link to server folder:
```bash
sudo mkdir -p /mnt/world
sudo mount /dev/disk/by-id/google-minecraft-world /mnt/world

# Optional: link to server folder
ln -s /mnt/world/world ./world
```

---

## Step 4 - Start the Minecraft Server

```bash
cd ~/minecraft-server
screen -S minecraft ./start.sh
```
- Using screen keeps ther server running after you log out.
- Connect via the Cold VM's public IP to verify everything works

---

> Tip: Always ensure only one VM has the world disk attached in READ_WRITE mode to avoid corrupion.

