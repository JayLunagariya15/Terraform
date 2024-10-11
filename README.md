# Terraform Azure Infrastructure with Application Gateway

This branch provides a **generic Terraform configuration** to set up an Azure Application Gateway. The infrastructure is designed to be modular and scalable, incorporating all necessary components like Virtual Networks, Subnets, Virtual Machines, Key Vault, and other resources.

## Features

- **Resource Group**: Organizes and manages all Azure resources.
- **Virtual Network (VNet)**: Networking setup for connecting resources.
- **Subnets**: Segmentation within the Virtual Network for different components.
- **Network Interface Cards (NIC)**: Associated with Virtual Machines for network connectivity.
- **Network Security Groups (NSG)**: Secures network traffic to and from Virtual Machines.
- **Virtual Machines (VMs)**: Compute resources configured in the Virtual Network.
- **Key Vault**: Secures sensitive data like secrets.
- **Bastion**: Provides secure and seamless access to Virtual Machines.
- **Application Gateway**: Handles HTTP load balancing, SSL termination, and routing for web applications.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure subscription with appropriate permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with this branch name
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to set the appropriate values for:

- Resource Group
- VNet, Subnets
- Application Gateway and other related resources

### 4. Plan the Infrastructure

```bash
terraform plan
```

### 5. Apply the Configuration

```bash
terraform apply
```

### 6. Destroy the Infrastructure

```bash
terraform destroy
```

## Folder Structure

```bash
.
├── main.tf              # Main Terraform configuration
├── provider.tf          # Azure provider configuration
├── variables.tf         # Input variables
├── terraform.tfvars     # Variable values for the infrastructure
├── rg/                  # Resource Group setup
├── vnet/                # Virtual Network setup
├── snet/                # Subnets
├── nic/                 # Network Interface Cards
├── nsg/                 # Network Security Groups
├── vms/                 # Virtual Machines
├── secret/              # Key Vault and secrets
├── bastion/             # Bastion setup for secure VM access
└── application-gateway/ # Application Gateway configuration
```

## Key Components

- **Application Gateway**: Configured to manage incoming web traffic with features like SSL offloading and web application firewall (WAF).
- **Virtual Machines**: Compute instances running within the Virtual Network, secured by Network Security Groups.
- **Bastion**: Provides secure access to the Virtual Machines without exposing public IP addresses.
- **Key Vault**: Stores sensitive data, such as SSL certificates for the Application Gateway.

## Variables

Ensure that the required variables in `terraform.tfvars` are defined to customize the deployment according to your environment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This `README.md` outlines the architecture and how to use the code in the branch focused on deploying an Application Gateway. It also provides a step-by-step guide for users to deploy and manage the infrastructure.
