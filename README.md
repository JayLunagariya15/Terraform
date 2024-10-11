# Terraform Azure Infrastructure with Key Vault

This branch contains Terraform code that provisions an Azure infrastructure, including Virtual Machines (VMs), Key Vault, and other networking resources. The code is modular, with each resource separated into folders for clarity and reuse.

## Features

The following resources are deployed:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Virtual Machines (VMs)
- Azure Key Vault (with secrets)
- Bastion Host for secure access

## Prerequisites

Ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with necessary permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the appropriate branch for the Key Vault setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to set the values for:

- Resource Group name
- VNet and Subnet details
- VM configurations
- Key Vault settings and secrets

### 4. Plan the Infrastructure

Preview the infrastructure changes:

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the resources with:

```bash
terraform apply
```

### 6. Destroy the Infrastructure

To remove the deployed infrastructure, run:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf              # Main configuration file
├── provider.tf          # Azure provider configuration
├── variables.tf         # Input variables
├── terraform.tfvars     # Variable values
├── rg/              # Resource Group
├── vnet/            # Virtual Network
├── snet/            # Subnet
├── nic/             # Network Interface Cards
├── nsg/             # Network Security Groups
├── vms/             # Virtual Machines
├── keyvault/        # Key Vault and Secrets
├── bastion/         # Bastion Host for secure access
```

## Key Components

- **Key Vault:** Securely stores secrets, keys, and sensitive data.
- **Bastion Host:** Provides secure remote access to VMs without exposing public IPs.
- **Network Security:** Uses Network Security Groups (NSGs) to control traffic to the VMs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README can be modified to fit the specific details of your setup.
