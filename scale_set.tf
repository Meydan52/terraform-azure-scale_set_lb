provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraform1" {
  name     = var.rg_name
  location = var.rg_region
}


resource "azurerm_virtual_network" "terraform_vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.terraform1.name
  location            = azurerm_resource_group.terraform1.location
  address_space       = var.vnet_ip
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet1_name
  resource_group_name  = azurerm_resource_group.terraform1.name
  virtual_network_name = azurerm_virtual_network.terraform_vnet.name
  address_prefixes     = var.subnet1_ip
}

resource "azurerm_linux_virtual_machine_scale_set" "ss" {
  name                            = var.ss_name
  resource_group_name             = azurerm_resource_group.terraform1.name
  location                        = azurerm_resource_group.terraform1.location
  sku                             = var.vm_sku
  instances                       = var.instance_number
  computer_name_prefix            = "testvmss"
  source_image_id                 = "/subscriptions/77333203-07cc-4166-ac0b-b786a47b8423/resourceGroups/StorageRG/providers/Microsoft.Compute/galleries/UbuntuApache1/images/targetUbuntu/versions/0.0.1"
  admin_username                  = var.admin_user_name
  admin_password                  = var.admin_password
  disable_password_authentication = false

  /*
  admin_ssh_key {
    username   = var.admin_user_name
    public_key = file("~/.ssh/id_rsa.pub")
  }
*/
/*
  source_image_reference {
    publisher = var.canonical_name
    offer     = var.UbuntuServer_name
    sku       = var.image_sku_name
    version   = "latest"
  }
*/
  os_disk {
    #create_option        = "FromImage"
    storage_account_type = var.Standard_LRS_name
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "ss_nic"
    primary = true

    ip_configuration {
      name                                   = "${var.ss_name}-nic"
      primary                                = true
      subnet_id                              = azurerm_subnet.subnet1.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.scalesetpool.id]
    }
  }

}
