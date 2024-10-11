# Terraform Azure VM with Conditional Public IP using Interpolation and Count

This branch contains Terraform code that provisions an Azure Virtual Machine (VM) with conditional Public IP creation, based on the value of `enable_public_ip`. The setup demonstrates how to use **interpolation** and the **count** feature to create resources dynamically.

## Features

The following resources are provisioned:

- Resource Group (RG)
- Virtual Network (VNet)
- Subnet (SNet)
- Network Interface Card (NIC)
- Public IP (conditionally created)
- Virtual Machine (VM)

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
git checkout <branch_name>  # Replace <branch_name> with the branch for this setup
```

### 2. Initialize Terraform

Initialize the Terraform environment:

```bash
terraform init
```

### 3. Configure Variables

Edit the `terraform.tfvars` file to set the following values:

- `enable_public_ip`: Set to `true` to create the VM with a Public IP, or `false` to create it without.
- Other necessary values like Resource Group name, VNet, and VM settings.

Example:

```hcl
enable_public_ip = true  # Creates VM with Public IP
# enable_public_ip = false  # Creates VM without Public IP
```

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
├── main.tf              # Main configuration file for all resources
├── terraform.tfvars     # Variable values (including conditional settings)
```

## Key Concepts

- **Conditional Public IP Creation:** By using the `count` and `enable_public_ip` variable, the configuration either creates or skips creating the Public IP resource dynamically.
- **Interpolation:** Terraform expressions and interpolation are used to dynamically configure resource properties based on input variables.

## Example

```hcl
resource "azurerm_public_ip" "example" {
  count = var.enable_public_ip ? 1 : 0
  name = "example-pip"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "example" {
  name = "example-nic"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.enable_public_ip ? azurerm_public_ip.example.id : null
  }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adjust the `README.md` to reflect any additional details as needed!
