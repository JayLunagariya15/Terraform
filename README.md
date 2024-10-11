# Terraform Azure Infrastructure with Dynamic Block Example (VNet)

This branch demonstrates how to use **dynamic blocks** in Terraform, focusing on Azure Virtual Network (VNet) configuration. The dynamic block allows the creation of multiple nested blocks dynamically based on the variable input.

## Features

- **Resource Group**: Manages all resources.
- **Virtual Network (VNet)**: Configured using a dynamic block to add multiple subnets or other configurations.

## Main Concept: Dynamic Block

This branch showcases how to use the **dynamic block** feature to conditionally create multiple configurations (like subnets) within the `azurerm_virtual_network` resource. Dynamic blocks are helpful for creating repeated nested blocks like `subnet` blocks inside a VNet dynamically based on input.

## Prerequisites

Ensure the following are installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with necessary permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the relevant branch for this setup
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Configure Variables

Edit `terraform.tfvars` to set values for:

- Resource Group name
- VNet and dynamic block configurations (like subnet details)

### 4. Plan the Infrastructure

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

### 6. Destroy the Infrastructure

To clean up the environment:

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
├── rg/                  # Resource Group
└── vnet/                # Virtual Network and dynamic block example
```

## Key Concepts

- **Dynamic Blocks**: These allow Terraform to generate multiple instances of a block within a resource based on a set of inputs, rather than defining each block individually.
- **Virtual Network (VNet)**: In this example, the dynamic block is used to define subnets or other related configurations.

You can easily add or remove subnets by adjusting the `subnets` variable in the `terraform.tfvars` file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This `README.md` explains how to use the dynamic block in this Terraform setup and provides guidance on configuring and applying the infrastructure. Adjust or expand it as needed!
