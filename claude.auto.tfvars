#terraform.tfvars -> automatically checked
#*.auto.tfvars -> automatically checked
nsg_rules = [{
  access                     = "Allow"
  destination_address_prefix = "*"
  destination_port_range     = "22"
  direction                  = "Inbound"
  name                       = "AllowSSH"
  priority                   = 110
  protocol                   = "Tcp"
  source_address_prefix      = "*"
  source_port_range          = "*"
  }, {
  access                     = "Allow"
  destination_address_prefix = "*"
  destination_port_range     = "80"
  direction                  = "Inbound"
  name                       = "AllowHTTP"
  priority                   = 120
  protocol                   = "Tcp"
  source_address_prefix      = "*"
  source_port_range          = "*"
  }, {
  access                     = "Allow"
  destination_address_prefix = "*"
  destination_port_range     = "443"
  direction                  = "Inbound"
  name                       = "AllowHTTPS"
  priority                   = 130
  protocol                   = "Tcp"
  source_address_prefix      = "*"
  source_port_range          = "*"
}]
# terraform plan --var-file="claude.tfvars" --out nsg
# terraform plan  --out nsg (use claude.auto.tfvars as tfvars filename)
#What will be the priority of the variables during execution?

#command line variables --var=
#command line file reference --var-file="*.tfvars"
#*.auto.tfvars
#terraform.tfvars
#environment variable
#default value in variable definition
