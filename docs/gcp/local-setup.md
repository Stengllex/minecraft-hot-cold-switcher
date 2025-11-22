
# 1. Install Required Tools

## Install Google Cloud CLI
https://docs.cloud.google.com/sdk/docs/install

---

## Install Terraform
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

---

# 2. Authenticate Locally

You have **two options** to authenticate Terraform locally:

---

## Option A — Use Your Personal Google Login (Simplest)

Use this when developing locally.

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

# 4. Run Terraform Locally

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
terraform apply
```

---

# 5. Environment Variables

Recommended local env shell exports:

```sh
export GOOGLE_PROJECT_ID="your-project-id"
```

---

# 6. Troubleshooting

### "No credential found"

Run:

```sh
gcloud auth application-default login
```

### "Permission denied"

Check service account roles:

```sh
gcloud projects get-iam-policy YOUR_PROJECT_ID
```

