# Terraform Azure Infrastructure with Two Virtual Machines

This repository contains Terraform code that provisions two Linux Virtual Machines (VMs) in Azure, complete with networking and security infrastructure. The code is organized into modular folders for each resource.

## Features

The following resources are deployed using this configuration:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Public IPs (PIP)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Two Linux Virtual Machines (VMs)

## Prerequisites

Before using this repository, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with permissions to create resources

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the correct branch for the 2 VMs setup
```

### 2. Initialize Terraform

Run the following command to initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to match your desired configuration. The file contains values for resources such as:

- Resource Group name
- Virtual Network settings
- Subnet details
- VM sizes and types
- Public IP configurations

### 4. Plan Infrastructure

To preview the changes that Terraform will make, run:

```bash
terraform plan
```

### 5. Apply Configuration

To apply the Terraform configuration and deploy the resources:

```bash
terraform apply
```

### 6. Destroy Infrastructure

To clean up and remove all resources created by Terraform, run:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf              # Orchestrates the modules and configurations
├── provider.tf          # Specifies the Azure provider configuration
├── variables.tf         # Defines the input variables
├── terraform.tfvars     # Values for the variables
├── rg/              # Code for Resource Group
├── vnet/            # Code for Virtual Network
├── snet/            # Code for Subnet
├── pip/             # Code for Public IP
├── nic/             # Code for Network Interface Cards
├── nsg/             # Code for Network Security Groups
├── vms/             # Code for Virtual Machines
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to update the branch name and any specific details as needed for your repository!
