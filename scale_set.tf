provider "azurerm" {
  features {}
}
/*
resource "azurerm_resource_group" "terraform1" {
  name     = var.rg_name
  location = var.rg_region
}
*/
resource "azurerm_linux_virtual_machine_scale_set" "ss" {
  name                            = var.ss_name
  resource_group_name             = var.rg_name
  location                        = var.rg_region
  sku                             = var.vm_sku
  instances                       = var.instance_number
  computer_name_prefix            = var.computer_name
  source_image_id                 = var.image_source
  admin_username                  = var.admin_user_name
  admin_password                  = var.admin_password
  disable_password_authentication = false

  /*
  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }
*/

  os_disk {

    storage_account_type = var.Standard_LRS_name
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "ss_nic"
    primary = true

    ip_configuration {
      name                                   = "${var.ss_name}-nic"
      primary                                = true
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.scalesetpool.id]
    }
  }

}
