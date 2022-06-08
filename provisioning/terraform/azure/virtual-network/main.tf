################################################
# Create Virtual Netowrk
################################################
resource "azurerm_network_security_group" "example" {
  name                = "${var.prefix}-security-group"
  location            = var.rg_location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "example" {
  name                = "${var.prefix}-network"
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = var.vn_address_space

  subnet {
    name           = "${var.prefix}-subnet1"
    address_prefix = var.subnet_address_prefixes[0]
  }

  subnet {
    name = "${var.prefix}-subnet2"

  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_prefixes[1]
  security_group       = azurerm_network_security_group.example.id
}