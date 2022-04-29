variable "nsg_rules" {
  description = "values for NSG rules"
  type = list(object({
    access                     = string
    destination_address_prefix = string
    destination_port_range     = string
    direction                  = string
    name                       = string
    priority                   = number
    protocol                   = string
    source_address_prefix      = string
    source_port_range          = string
  }))
  /*validation {
    #condition = can(length(var.admin_password) > 5 && length(var.password) < 10)
    #error_message = "message"
  }*/
}