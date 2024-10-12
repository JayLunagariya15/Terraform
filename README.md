# Terraform Azure Infrastructure with Firewall

This branch contains Terraform code that provisions a complete Azure infrastructure, including a firewall, in a generic configuration. The setup covers resource groups, virtual networks, subnets, NICs, NSGs, VMs, Key Vault, Bastion, Load Balancer, VNet peering, and Firewall.

## Features

- **Resource Group**: Organizes all resources.
- **Virtual Network (VNet)**: Provides networking infrastructure.
- **Subnets**: Defined within the VNet.
- **Network Security Groups (NSGs)**: Controls traffic flow.
- **Virtual Machines (VMs)**: Instances within the subnets.
- **Key Vault**: Manages secrets for secure access.
- **Bastion**: Securely accesses VMs without public IP.
- **Load Balancer**: Distributes network traffic.
- **VNet Peering**: Connects VNets for inter-network communication.
- **Firewall**: Ensures secure traffic control and filtering.

## Prerequisites

Make sure to install:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with appropriate permissions

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

- Resource Group names
- VNet, Subnet, NSG, and VM configurations
- Firewall rules, secrets, and peering settings

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
├── vnet/                # Virtual Network
├── snet/                # Subnets
├── nic/                 # Network Interfaces
├── nsg/                 # Network Security Groups
├── vm/                  # Virtual Machines
├── keyvault/            # Key Vault and Secrets
├── bastion/             # Bastion host
├── loadbalancer/        # Load Balancer
├── firewall/            # Azure Firewall and policies
└── vnet-peering/        # VNet Peering configuration
```

## Key Concepts

- **Firewall**: Provides stateful packet inspection, high availability, and unrestricted cloud scalability to control traffic flow and protect resources.
- **VNet Peering**: Connects separate VNets, enabling resources to communicate securely.
- **Load Balancer**: Ensures high availability and balances incoming traffic between VMs.
- **Bastion**: Secure VM access without exposing public IPs.


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adjust or add more details to the `README.md` as needed!
