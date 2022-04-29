provider "azurerm" {
  features {}
  alias           = "prodsubscription" #alias for subscription
  subscription_id = "b2d3029d-a6ac-4690-b005-312bba3a7639"
  client_id       = "129b5913-a8e3-4fd5-8f41-f3e2a2547f63"
  client_secret   = "ej3MhK1xUFK9C-YCo370w1HeTCuibFQECV"
  tenant_id       = "cea297cb-9bde-428d-9a6e-48fa9c582ed6"
}
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.97.0,<=3.3.0" #locks azurerm version
    }
  }
  required_version = ">=1.1.0" #locks terraform version
}
resource "azurerm_resource_group" "example" {
  provider = azurerm.prodsubscription #creates resource group in prodsubscription
  name     = "rg-nsg"
  location = "westus"
}
resource "azurerm_network_security_group" "example" {
  provider            = azurerm.prodsubscription
  name                = "my-nsg"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      access                     = security_rule.value["access"]
      destination_address_prefix = security_rule.value["destination_address_prefix"]
      destination_port_range     = security_rule.value["destination_port_range"]
      direction                  = security_rule.value["direction"]
      name                       = security_rule.value["name"]
      priority                   = security_rule.value["priority"]
      protocol                   = security_rule.value["protocol"]
      source_address_prefix      = security_rule.value["source_address_prefix"]
      source_port_range          = security_rule.value["source_port_range"]
    }
  }
}
resource "azurerm_resource_group" "example1" {
  provider = azurerm.prodsubscription
  name     = "rg-import"
  location = "westus"
}
#GIT
#git config --global user.name "docdoom12345"
#git config --global user.email "docdoom12345@outlook.com"