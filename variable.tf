
variable "rg_name" {
  description = "Resource group name"
  type        = string
  default     = "my_default_rg"
}
variable "rg_region" {
  description = "Resource group location"
  type        = string
  default     = "Central US"
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
  default     = "my_default_vnet"
}

variable "vnet_ip" {
  description = "VNET Ip"
  type        = list(any)
  default     = ["10.0.0.0/16"]
}


variable "subnet1_name" {
  description = "SUbnet name"
  type        = string
  default     = "my_subnet1"
}

variable "subnet1_ip" {
  description = "Subnet 1  Ip"
  type        = list(any)
  default     = ["10.0.1.0/24"]
}
variable "ss_name" {
  description = "ss name"
  type        = string
  default     = "my_ss01"
}

variable "subnet3_id" {
  description = "ss name"
  type        = string
  default     = "my_ss01"
}


variable "vm_sku" {
  description = "Virtual Machine SKU"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "instance_number" {
  description = "Number of instance"
  type        = number
  default     = 1
}

variable "admin_user_name" {
  description = "Admin user name"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin user password"
  type        = string
  default     = "&*$867user34"
}

variable "image_source" {
  description = "Golden image source"
  type        = string
  default     = ""
}

variable "computer_name" {
  description = "SS VM name"
  type        = string
  default     = "testvmss"
}

variable "Standard_LRS_name" {
  description = "Standard_LRS name"
  type        = string
  default     = "Standard_LRS"
}

variable "vnet_id" {
  description = "vnet id"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "vnet id"
  type        = string
  default     = ""
}

variable "db_resource_id" {
  description = "Resource ID of the database"
  type        = string
  default     = ""
}