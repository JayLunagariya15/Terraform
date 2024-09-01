resource "azurerm_linux_virtual_machine" "Petroleum_vm" {
  for_each                        = var.Petroleum-vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = "Petroleumadmin"
  admin_password                  = "info@123"
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [data.azurerm_network_interface.Petroleum_nic_data[each.key].id]

  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
  }
  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
}

# admin_username                  = data.azurerm_key_vault_secret.Petroleum_secret_username_data.value
# admin_password                  = data.azurerm_key_vault_secret.Petroleum_secret_password_data.value
