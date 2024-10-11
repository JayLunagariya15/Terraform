# Terraform Azure Infrastructure with Storage Account

This branch contains Terraform code that provisions an Azure Storage Account along with a Resource Group (RG) and Storage Container. The configuration is structured but not modular, with each resource defined in separate Terraform files.

## Features

The following resources are provisioned:

- Resource Group (RG)
- Azure Storage Account
- Azure Storage Container

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
git checkout <branch_name>  # Replace <branch_name> with the branch for the Storage Account setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to set the values for:

- Resource Group name
- Storage Account name and properties
- Storage Container settings

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
├── rg/                  # Resource Group
├── storage_account/     # Storage Account
└── storage_container/    # Storage Container
```

## Key Components

- **Azure Storage Account:** Provides a scalable and secure way to store data in Azure.
- **Storage Container:** Organizes blobs (binary large objects) within the storage account.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize this `README.md` to fit your specific needs!
