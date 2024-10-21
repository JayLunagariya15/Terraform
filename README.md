# Terraform Azure Infrastructure Deployment with Local Blocks

This repository contains Terraform code that demonstrates the use of **local blocks** for simplifying and optimizing infrastructure deployment on Azure. The configuration deploys a resource group and a storage account with reusable local variables to handle tagging and other common values across resources.

## Features

The following resources are provisioned using this Terraform configuration:

- Azure Resource Group (RG)
- Azure Storage Account (conditional creation based on variable input)

The use of **local blocks** allows for more efficient handling of shared values, such as common tags, across multiple resources, and offers flexibility in conditional resource creation.

## Prerequisites

Before running the Terraform scripts, ensure the following tools are installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- An Azure account with sufficient permissions to create resources

## Usage

### 1. Clone the Repository

```bash
git clone https://github.com/JayLunagariya15/Terraform.git
cd your-repo
```

### 2. Initialize Terraform

Run the following command to initialize the working directory and download necessary provider plugins:

```bash
terraform init
```

### 3. Modify Variables (Optional)

Update `terraform.tfvars` to customize values like resource group name, location, or storage account name.

```hcl
rg_name     = "myResourceGroup"
location    = "East US"
st_account  = "mystorageaccount"
```

Alternatively, modify variables directly inside the `variable.tf` file to match your requirements.

### 4. Plan Infrastructure

Generate and review the execution plan by running:

```bash
terraform plan
```

This shows the actions Terraform will perform without making any changes.

### 5. Apply Changes

Apply the Terraform configuration to create resources in your Azure subscription:

```bash
terraform apply
```

You will be prompted to confirm before the resources are created.

### 6. Destroy Infrastructure

To clean up and delete all the resources created by the configuration:

```bash
terraform destroy
```

This command will remove everything that was provisioned.

## Files in the Repository

- `main.tf`: Defines the infrastructure resources, using local blocks for shared values like tags.
- `terraform.tfvars`: Specifies input values for variables such as resource group name and storage account.
- `variable.tf`: Contains variable definitions for the project.
- `provider.tf`: Configures the Azure provider.
- `locals.tf`: Defines reusable local blocks to manage common values like tags, improving code clarity and maintainability.

## Key Concepts: Local Blocks

The `locals.tf` file includes **local blocks**, which are used to define values that are reused across the configuration. This helps maintain consistency and reduce redundancy in resource definitions. Local variables are particularly useful for managing tags or setting conditional logic across resources.

## Example Use Case

- **Conditional Resource Creation**: The configuration can conditionally create a storage account based on the input value of `st_account`. This is achieved using conditional expressions in conjunction with local variables.
- **Tag Management**: The use of local blocks ensures that tags are consistently applied across resources, and can easily be extended or modified as needed.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

By utilizing **local blocks** and conditional resource creation, this Terraform setup promotes efficient, modular, and maintainable infrastructure code. Feel free to extend or modify the setup to suit more complex scenarios.
