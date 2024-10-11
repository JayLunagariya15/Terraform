# Terraform Azure Hub and Spoke Model

This branch contains Terraform code that provisions a simple **Hub and Spoke** model in Azure. It includes one hub (host) and two spokes (spoke networks), designed with a generic configuration. The resources are defined in separate files for resource groups, virtual networks, subnets, and virtual machines.

## Features

The following components are provisioned in a Hub and Spoke architecture:

- **Hub Network (Host)**: Centralized VNet connecting to spoke VNets.
- **Two Spoke VNets**: VNets peered with the hub.
- **Subnets**: Defined within each VNet.
- **Virtual Machines (VMs)**: Deployed in the spokes.

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
git checkout <branch_name>  # Replace <branch_name> with the branch for this Hub and Spoke setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to set values for:

- Resource Group names
- Virtual Network (VNet) and Subnet configurations
- Virtual Machine details (VM names, sizes, etc.)

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
├── vnet/                # Virtual Network (Hub and Spokes)
├── snet/                # Subnets within the VNets
└── vm/                  # Virtual Machines deployed in spokes
```

## Key Concepts

- **Hub and Spoke Model:** A scalable and secure network topology that centralizes network traffic control in the hub VNet, allowing spoke VNets to communicate with each other and the hub.
- **VNet Peering:** The configuration includes peering between the hub VNet and the two spoke VNets for seamless communication.
- **Modular Design:** Though the folder structure is not in Terraform modules, each component is logically separated into different files for better organization and reuse.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to modify this `README.md` to reflect any additional details as needed!
