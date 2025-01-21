# aws_learning
# Website Development with Jenkins Job on AWS EC2 using Terraform

This guide explains how to set up a website development pipeline using Jenkins hosted on an AWS EC2 instance, provisioned with Terraform.

---

## Prerequisites

### Tools Required:
- AWS Account
- Terraform (installed and configured)
- SSH Key Pair (for EC2 access)
- Jenkins installed

### AWS Requirements:
- Access Key and Secret Key with appropriate IAM permissions.

---

## Project Structure

```
project-directory/
|-- main.tf
|-- outputs.tf
|-- variables.tf
|-- terraform.tfvars
|-- README.md
```

### 1. Configure Terraform Files

### 2. Initialize and Apply Terraform Configuration

Run the following commands in your terminal:

```bash
terraform init
terraform apply -auto-approve
```

Once the process completes, note the `jenkins_url` output for accessing Jenkins.

---

### 3. Access Jenkins

- Navigate to the Jenkins URL (e.g., `http://<instance_public_ip>:8080`).
- Retrieve the initial admin password:
  ```bash
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
  ```
- Complete the Jenkins setup wizard.

---

### 4. Create a Jenkins Job

1. Log in to Jenkins.
2. Click on **New Item** > Enter a name > Select **Freestyle Project**.
3. Configure your project to pull code from your Git repository.
4. Add build steps, e.g.,:
   - Install dependencies.
   - Build the project.
   - Deploy to a web server (if needed).
5. Save and run the job.

---

### 5. Cleanup Resources

To avoid incurring unnecessary costs, destroy the resources when not in use:

```bash
terraform destroy -auto-approve
```

---
