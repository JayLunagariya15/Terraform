# Terraform Azure Complex Infrastructure with Load Balancer

This branch contains Terraform code for a complex Azure infrastructure, including Virtual Machines (VMs), a Load Balancer, Key Vault, Bastion, and various networking resources. The code is modular, organized by resource type, and uses a generic approach for flexibility and scalability.

## Features

The infrastructure provisions the following resources:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Virtual Machines (VMs)
- Load Balancer (LB)
- Key Vault with Secrets
- Bastion Host for secure access

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
git checkout <branch_name>  # Replace <branch_name> with the correct branch for the Load Balancer setup
```

### 2. Initialize Terraform

Initialize the working directory containing Terraform files:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to match your infrastructure needs. Variables include configurations for:

- Resource Group name
- VNet, Subnet configurations
- VM sizes and types
- Load Balancer settings
- Key Vault and secrets
- Bastion configuration

### 4. Plan Infrastructure

Preview the changes that will be made by Terraform:

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the infrastructure by running:

```bash
terraform apply
```

### 6. Destroy the Infrastructure

To destroy and remove the deployed resources, use:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf              # Main configuration for the infrastructure
├── provider.tf          # Provider setup for Azure
├── variables.tf         # Input variables
├── terraform.tfvars     # Values for the variables
├── rg/              # Resource Group
├── vnet/            # Virtual Network
├── snet/            # Subnet
├── nic/             # Network Interface Cards
├── nsg/             # Network Security Groups
├── vms/             # Virtual Machines
├── bastion/         # Bastion Host for secure access
├── keyvault/        # Key Vault and Secrets
├── loadbalancer/    # Load Balancer configuration
```

## Key Components

### Load Balancer
- Configures a public-facing Load Balancer for distributing traffic across VMs.

### Bastion Host
- Secure remote access to VMs without exposing their public IPs.

### Key Vault and Secrets
- Manages sensitive information like SSH keys and passwords securely.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README is designed to document the complex architecture and guide users through deploying the infrastructure. Adjust the branch name and any specific details as needed!
