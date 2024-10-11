# Terraform Azure Infrastructure with VNet Peering

This branch contains Terraform code that provisions an Azure infrastructure, including Virtual Machines (VMs), Key Vault, Bastion, Load Balancer, and VNet Peering. The configuration is structured, but not within modules, with each resource defined in separate Terraform files.

## Features

The following resources are deployed:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Cards (NIC)
- Network Security Groups (NSG)
- Virtual Machines (VMs)
- Azure Key Vault with Secrets
- Bastion Host for secure access
- Load Balancer (LB)
- VNet Peering between networks

## Prerequisites

Ensure the following tools are installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with the necessary permissions

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd Terraform
git checkout <branch_name>  # Replace <branch_name> with the branch for the VNet Peering setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to configure the following:

- Resource Group name
- VNet, Subnet details
- VM sizes and configurations
- Key Vault settings and secrets
- Bastion, Load Balancer, and VNet Peering settings

### 4. Plan the Infrastructure

Preview the infrastructure changes with:

```bash
terraform plan
```

### 5. Apply the Configuration

Deploy the resources:

```bash
terraform apply
```

### 6. Destroy the Infrastructure

To remove the infrastructure:

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
├── vnet/                # Virtual Network
├── snet/                # Subnet
├── nic/                 # Network Interface Cards
├── nsg/                 # Network Security Groups
├── vms/                 # Virtual Machines
├── keyvault/            # Key Vault and secrets
├── bastion/             # Bastion Host for secure access
├── loadbalancer/        # Load Balancer
├── vnetpeering/         # VNet Peering configuration
```

## Key Components

- **VNet Peering:** Enables communication between Virtual Networks, allowing seamless traffic flow across VNets.
- **Azure Bastion:** Provides secure remote access to VMs without public IPs.
- **Load Balancer:** Distributes traffic across multiple VMs.
- **Key Vault:** Securely stores sensitive information like SSH keys and secrets.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to update this `README.md` to suit your specific project needs!
