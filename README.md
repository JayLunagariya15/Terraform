# Terraform Azure Infrastructure Deployment

This repository contains Terraform code to deploy a basic Azure infrastructure that includes a Linux Virtual Machine (VM) along with associated networking and security resources.

## Features

The following resources are provisioned using this Terraform configuration:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet
- Public IP (PIP)
- Network Interface Card (NIC)
- Network Security Group (NSG)
- Linux Virtual Machine (VM)

## Prerequisites

Before running the Terraform scripts, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with appropriate permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd your-repo
```

### 2. Initialize Terraform

Run the following command to initialize the working directory containing the Terraform configuration files:

```bash
terraform init
```

### 3. Modify Variables (Optional)

If your Terraform code includes a `variables.tf` file or has variables in `main.tf`, you can modify them by updating `terraform.tfvars` or directly inside `main.tf`. Examples include specifying the region, VM size, or admin credentials.

### 4. Plan Infrastructure

To see the changes Terraform will make, run the plan command:

```bash
terraform plan
```

### 5. Apply Changes

Apply the Terraform configuration to create the resources in Azure:

```bash
terraform apply
```

### 6. Destroy Infrastructure

To remove all resources created by this Terraform configuration, use the destroy command:

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf         # Contains the main infrastructure setup
└── README.md       # This file
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify this based on the specific details of your Terraform project, such as adding more resources or explaining advanced configurations like the use of SSH keys or remote state management.
