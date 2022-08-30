# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "stage-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["192.168.0.0/16"]
}

# Create a Subnet for VM
resource "azurerm_subnet" "subnet" {
  name                 = "aks-subnet"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["192.168.0.0/24"]
}