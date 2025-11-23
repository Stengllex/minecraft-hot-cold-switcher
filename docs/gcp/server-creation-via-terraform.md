
# 1. Install Required Tools

## Install Google Cloud CLI
https://docs.cloud.google.com/sdk/docs/install

---

## Install Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

---

# 2. Authenticate Locally

Use Your Personal Google Login (Simplest)

```sh
gcloud auth login
gcloud auth application-default login
```

This creates credentials that Terraform can use automatically.

### Set Project

```sh
gcloud config set project YOUR_PROJECT_ID
```

---

# 3. Create the Terraform Service Account (No Keys!)

```sh
gcloud iam service-accounts create terraform --display-name="Terraform SA"
```

### Grant Required Roles

```sh
gcloud projects add-iam-policy-binding YOUR_PROJECT_ID \
  --member="serviceAccount:terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/editor"   # adjust if needed
```

You may refine permissions later.

---
# 4. Environment Variables

Recommended local env shell exports:

```sh
export GOOGLE_PROJECT_ID="your-project-id"
```

---

# 5. Run Terraform Locally

### Initialize

```sh
terraform init
```

### Plan

```sh
terraform plan \
  -var="project_id=$GOOGLE_PROJECT_ID"
```

### Apply

```sh
terraform apply -var="project_id=$GOOGLE_PROJECT_ID"
```

