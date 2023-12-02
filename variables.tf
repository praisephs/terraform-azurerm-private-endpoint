# variables.tf
variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created."

}

variable "location" {
  type        = string
  description = "(Required) The Azure location where the Windows Virtual Machine should exist. Changing this forces a new resource to be created."
}

variable "virtual_network_name" {
  type        = string
  description = "(Required) Specifies the name of the Virtual Network this Subnet is located within."
}

variable "virtual_network_resource_group_name" {
  type        = string
  description = "(Required) Specifies the Name of the Resource Group within which the virtual network should exist. Changing this forces a new resource to be created."

}

variable "subnet_name" {
  type        = string
  description = "(Required) The name of the subnet. Changing this forces a new resource to be created."
}

variable "private_endpoint_name" {
  type        = string
  description = "Connects subnet in the virtual network privately and securely to a service powered by Azure Private Link"
}

variable "private_connection_resource_id" {
  type        = string
  description = "(Required) Specifies the list of Private DNS Zones to include within the private_dns_zone_group"

}

variable "subresource_names" {
  type        = list(string)
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to"
}

variable "is_manual_connection" {
  type        = bool
  default     = false
  description = " (Required) Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created."
}

variable "private_dns_zone_name" {
  type        = string
  description = "The name of the Private DNS Zone."
}

variable "private_dns_resource_group_name" {
  type        = string
  description = "(Optional) The Name of the Resource Group where the Private DNS Zone exists. If the Name of the Resource Group is not provided, the first Private DNS Zone from the list of Private DNS Zones in your subscription that matches name will be returned."
}