# Terraform Backend Setup with EC2 Instance

This project demonstrates how to set up a **remote backend** in Terraform using **AWS S3** for state storage and **DynamoDB** for state locking, along with launching an **EC2 instance**.  
This is the recommended and industry-standard way to manage Terraform state safely.

---

## ✅ What Was Done

### 1. **Created S3 Bucket for Terraform State**
- Stores the `terraform.tfstate` file remotely.
- Prevents accidental loss of state.
- Makes Terraform safe for team use.

### 2. **Created DynamoDB Table for State Locking**
- Prevents two people or processes from running Terraform at the same time.
- Avoids state corruption.

### 3. **Migrated Local State to S3**
Used:

```
terraform init -migrate-state
```

- Moves existing local state to S3.
- Enables locking with DynamoDB.

### 4. **Launched an EC2 Instance**
- Region: ap-south-1  
- AMI: Amazon Linux 2023  
- Instance Type: t2.micro (free tier eligible)

---

## 🧱 Project Structure

```
providers.tf   # AWS provider and versions
backend.tf     # Remote backend configuration (S3 + DynamoDB)
main.tf        # S3 bucket, DynamoDB table, EC2 instance
.gitignore     # Excludes local Terraform files
README.md      # Project documentation
```

---

## 🟩 Commands Used

### Initialize Terraform:
```
terraform init
```

### Create S3, DynamoDB, EC2:
```
terraform apply
```

### Migrate state to S3:
```
terraform init -migrate-state
```

---

## ⭐ Best Practices Followed

- **Remote backend used (S3)** → avoids losing local state.
- **DynamoDB locking enabled** → prevents simultaneous Terraform runs.
- **`.gitignore` added** → ensures no `.terraform` or `.tfstate` files get committed.
- **Provider version pinned** → stable and reproducible builds.
- **EC2 instance defined in IaC** → fully managed by Terraform.

---

## ✔️ Summary

You successfully configured a secure Terraform backend and deployed an EC2 instance using best practices.  
This setup is production-ready and scalable for future AWS resources.
