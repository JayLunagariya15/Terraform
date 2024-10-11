# Terraform Azure Infrastructure with Bastion

This branch contains Terraform code that provisions Azure infrastructure, including Virtual Machines (VMs) and Bastion, along with necessary networking resources. The configuration is modular, with each resource type organized into separate folders.

## Features

The following resources are provisioned:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Virtual Machines (VMs)
- Azure Bastion for secure remote access

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
git checkout <branch_name>  # Replace <branch_name> with the branch for the Bastion setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to configure the values for:

- Resource Group name
- Virtual Network, Subnet details
- VM sizes and other properties
- Bastion settings

### 4. Plan the Infrastructure

To preview the infrastructure changes:

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
├── bastion/         # Bastion configuration
```

## Key Components

- **Azure Bastion:** Provides secure remote access to the Virtual Machines (VMs) without exposing public IPs.
- **Networking:** Configures Virtual Networks (VNets), Subnets, NICs, and NSGs to ensure secure communication between resources.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify this `README.md` to fit your specific use case!
