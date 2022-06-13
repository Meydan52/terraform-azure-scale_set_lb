module "scale_set_lb" {
  source            = "Meydan52/scale_set_lb/azure"
  rg_name           = "my_test4SS_rg"
  rg_region         = "Central US"
  subnet_id         = ""
  ss_name           = "mytestss-12346"
  vm_sku            = "Standard_D2s_v3"
  instance_number   = 1
  admin_user_name   = "adminuser"
  admin_password    = "&*$867user34"
  image_source      = "/subscriptions/77333203-07cc-4166-ac0b-b786a47b8423/resourceGroups/StorageRG/providers/Microsoft.Compute/galleries/UbuntuApache1/images/targetUbuntu/versions/0.0.1"
  computer_name     = "mywpvm"
  Standard_LRS_name = "Standard_LRS"
  db_resource_id    = ""
}
