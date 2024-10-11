# Terraform Azure Landing Zone

This branch contains Terraform code for provisioning an Azure landing zone. It supports multiple environments (dev, prod, QA) with dedicated configurations. The infrastructure includes Virtual Machines (VMs), a Load Balancer, Key Vault, and Bastion for secure access.

## Features

The following resources are deployed:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Virtual Machines (VMs)
- Key Vault with Secrets
- Bastion Host for secure access
- Load Balancer (LB)

## Prerequisites

Ensure that you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with sufficient permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the branch for the landing zone setup
```

### 2. Navigate to Environment Folder

This repository supports different environments (dev, prod, QA). Navigate to the environment you want to deploy:

```bash
cd environments/dev  # Or replace 'dev' with 'prod' or 'QA'
```

### 3. Initialize Terraform

In the desired environment folder, initialize Terraform:

```bash
terraform init
```

### 4. Configure Variables

Edit the `terraform.tfvars` file inside the chosen environment folder to set your resource configurations, such as:

- Resource Group name
- VNet, Subnet configurations
- VM sizes and types
- Load Balancer settings
- Key Vault and secrets
- Bastion configuration

### 5. Plan Infrastructure

To preview the changes Terraform will make, run:

```bash
terraform plan
```

### 6. Apply Configuration

Deploy the infrastructure using:

```bash
terraform apply
```

### 7. Destroy Infrastructure

To remove the infrastructure, run:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── Environments/
│   ├── dev/
│   │   ├── main.tf             # Dev-specific configuration
│   │   ├── provider.tf         # Provider settings for dev
│   │   ├── variables.tf        # Input variables for dev
│   │   ├── terraform.tfvars    # Variable values for dev
│   ├── prod/
│   ├── QA/
├── Modules/
│   ├── rg/                     # Resource Group
│   ├── vnet/                   # Virtual Network
│   ├── snet/                   # Subnet
│   ├── vms/                    # Virtual Machines
│   ├── bastion/                # Bastion Host
│   ├── keyvault/               # Key Vault and Secrets
│   ├── loadbalancer/           # Load Balancer
```

## Key Components

- **Landing Zone:** Provides a secure, scalable infrastructure foundation.
- **Multi-environment Support:** Allows deployment to different environments (dev, prod, QA) with separate configurations.
- **Load Balancer:** Distributes traffic across VMs.
- **Bastion Host:** Provides secure, remote access without exposing public IPs.
- **Key Vault:** Stores sensitive information like SSH keys and secrets.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Make sure to update the branch name and details to match your specific configuration!
