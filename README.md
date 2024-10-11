# Terraform Azure Infrastructure with Two Private IP Virtual Machines

This branch contains Terraform code that provisions two Linux Virtual Machines (VMs) in Azure, both with private IP addresses. The code is modular, with each resource split into its respective folder.

## Features

The following resources are deployed using this configuration:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Two Linux Virtual Machines (VMs) (Private IPs only)

## Prerequisites

Ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with the necessary permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the branch for private IP VM setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file with your desired values for resources such as:

- Resource Group name
- Virtual Network settings
- Subnet details
- VM sizes and types

### 4. Plan the Infrastructure

Preview the changes with:

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the infrastructure:

```bash
terraform apply
```

### 6. Destroy the Infrastructure

To remove all resources created by this configuration, use:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf              # Main Terraform configuration
├── provider.tf          # Azure provider settings
├── variables.tf         # Input variables definition
├── terraform.tfvars     # Variable values for the infrastructure
├── rg/              # Resource Group
├── vnet/            # Virtual Network
├── snet/            # Subnet
├── nic/             # Network Interface Cards
├── nsg/             # Network Security Groups
├── vms/             # Virtual Machines with Private IPs
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

You can adjust the branch name and further details to match your specific setup!
