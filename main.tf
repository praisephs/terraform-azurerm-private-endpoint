resource "azurerm_resource_group" "this" {
  name     = "demo-rg1"
  location = "eastus2"
}

resource "azurerm_storage_account" "this" {
  name                     = "perizersandboxdevops"
  resource_group_name      = "demo-rg"
  location                 = "eastus2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

data "azurerm_private_dns_zone" "this" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = "private-dns-zone-sandbox"
}

data "azurerm_virtual_network" "this" {
  name                = "core-infra-sandbox-vnet"
  resource_group_name = "core-infra-sandbox-rg"
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "sandbox_vnet_link"
  resource_group_name   = data.azurerm_private_dns_zone.this.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.this.name
  virtual_network_id    = data.azurerm_virtual_network.this.id
}

module "private_endpoint" {
  source                              = "../"
  resource_group_name                 = azurerm_resource_group.this.name
  location                            = azurerm_resource_group.this.location
  virtual_network_resource_group_name = "core-infra-sandbox-rg"
  virtual_network_name                = "core-infra-sandbox-vnet"
  subnet_name                         = "Web"
  private_endpoint_name               = "perizer_private_endpoint"
  private_connection_resource_id      = azurerm_storage_account.this.id
  subresource_names                   = ["blob"]
  private_dns_zone_name               = "privatelink.blob.core.windows.net"
  private_dns_resource_group_name     = "private-dns-zone-sandbox"
}