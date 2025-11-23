# Server Setup after creation

This guide describes how to setup both hot and cold server, attach the world disk to VMs, and install and start the Minecraft modpack.

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

## Step 2 — Attach the world disk to the VM

```bash
gcloud compute instances attach-disk minecraft-cold \
  --disk minecraft-world \
  --zone europe-west4-a
```
- Attach in READ_WRITE mode.
- Makes the same persistent world available to the Cold VM.

## Step 3 - Format disk !!ONLY DO THIS ONCE!!
1. SSH into the Cold VM:
```bash
gcloud compute ssh minecraft-cold --zone europe-west4-a
```
```bash
sudo mkfs.ext4 -F /dev/disk/by-id/google-persistent-disk-1
```

## Step 4 — Install and start Minecraft Modpack 

1. Download server files and copy to your machine
https://www.curseforge.com/minecraft/modpacks/all-the-mods-10/files/7223081
for curseforge modpacks it is easier to download the serverfiles localy and use SCP to move them to the machine (to not run into an 403 when using wget)

> on your local machine:
```bash
gcloud compute scp .\Downloads\ServerFiles-5.1.zip minecraft-cold:/tmp/.
```

2. SSH into the Cold VM:
```bash
gcloud compute ssh minecraft-cold --zone europe-west4-a
```

> on the remote machine
3. Update packages:
```bash
sudo apt update
sudo apt upgrade
```

4. Install Java
https://learn.microsoft.com/en-us/java/openjdk/install#debian-10---12
```bash
sudo apt update
sudo apt install wget lsb-release -y
wget https://packages.microsoft.com/config/debian/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
```
```bash
sudo apt update
sudo apt install msopenjdk-21
```

5. Mount the world disk and link to server folder:
```bash
sudo mkdir -p /mnt/world
sudo chown minecraft:minecraft /mnt/world
sudo mount /dev/disk/by-id/google-persistent-disk-1 /mnt/world
```

6. Create a user for minecraft
```bash
sudo useradd -m minecraft -s /bin/bash
sudo -u minecraft -i
```

7. and install minecraft
> on the remote machine
```bash
mkdir -p ~/minecraft-server
cd ~/minecraft-server

ln -s /mnt/world/world ./world

mv /tmp/ServerFiles-5.1.zip .
unzip ServerFiles-5.1.zip
chmod +x startserver.sh
./startserver.sh
```


---


> Always ensure only one VM has the world disk attached in READ_WRITE mode to avoid corrupion.

## Step 5 - Setup hot vm
repeat step 1,2 and 4
