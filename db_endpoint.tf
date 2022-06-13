# Private endpoint into the first subnet for the database connection 
/*
resource "azurerm_private_endpoint" "db_endpoint" {
  name                = "db-endpoint"
  location            = var.rg_region
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "db-server-connection"
    private_connection_resource_id = var.db_resource_id
    is_manual_connection           = false
  }
}
*/