# Terraform Azure Infrastructure Deployment with Output Blocks

This repository contains Terraform code that demonstrates the use of **local blocks** and **output blocks** for deploying Azure infrastructure. The configuration provisions a resource group and a storage account, and outputs useful information such as resource group names and storage account details.

## Features

The following resources are provisioned using this Terraform configuration:

- Azure Resource Group (RG)
- Azure Storage Account (conditionally created based on input variable)

The use of **local blocks** helps simplify resource configurations, and **output blocks** provide easy access to important details after the resources are provisioned.

## Prerequisites

Before running the Terraform scripts, ensure you have the following installed:

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

Initialize the working directory by running:

```bash
terraform init
```

### 3. Modify Variables (Optional)

Customize the deployment by editing `terraform.tfvars` to update variables like resource group name, location, or storage account name.

```hcl
rg_name     = "myResourceGroup"
location    = "East US"
st_account  = "mystorageaccount"
```

Alternatively, you can modify variables directly in the `variable.tf` file.

### 4. Plan Infrastructure

View the planned changes without actually applying them by running:

```bash
terraform plan
```

### 5. Apply Changes

Create the resources by applying the Terraform configuration:

```bash
terraform apply
```

You will be prompted to confirm before the resources are created.

### 6. View Outputs

Once the resources are created, you can view the outputs defined in `output.tf`:

```bash
terraform output
```

This will display important information such as resource group name and storage account details (if created).

### 7. Destroy Infrastructure

To delete all resources created by this configuration, use the following command:

```bash
terraform destroy
```

## Files in the Repository

- `main.tf`: Defines the resources for the infrastructure, including the resource group and storage account.
- `terraform.tfvars`: Contains input variable values, like resource group name and storage account name.
- `variable.tf`: Defines the variables used in the configuration.
- `provider.tf`: Configures the Azure provider.
- `locals.tf`: Contains local blocks for managing shared values like tags.
- `output.tf`: Defines output blocks to provide useful information about the created resources.

## Key Concepts

- **Local Blocks**: The `locals.tf` file contains local blocks, which simplify code by managing common values such as tags across multiple resources. This improves code clarity and reduces duplication.
- **Output Blocks**: The `output.tf` file contains output blocks that return key information after the infrastructure is created, such as the resource group name and the storage account details. This information can be used in other configurations or shared with other team members.

## Example Use Case

- **Conditional Resource Creation**: The configuration includes conditional logic to create the storage account only if certain criteria are met.
- **Tag and Resource Management**: Local blocks ensure consistent tagging across all resources, while output blocks provide an easy way to retrieve resource information after deployment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

By leveraging **local blocks** and **output blocks**, this Terraform configuration simplifies infrastructure deployment while providing useful insights into the resources it manages. You can extend this setup for more advanced use cases and cloud services.
