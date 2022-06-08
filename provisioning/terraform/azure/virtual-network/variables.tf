variable "prefix" {
  default     = "un"
  type        = string
  description = "Each resource name will start from this prefix"
}

variable "rg_name" {
  type        = string
  description = "Name of the reosurce group"
}

variable "rg_location" {
  type        = string
  description = "Location of the reosuce groupcs"
}

variable "vn_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address space for virtual network"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "list of cidr blocks for each subnet"
}