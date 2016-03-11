# Module specific  variables
variable "vm_name" {
    default = {}
}

variable "number_of_instance" {
        description = "number of instances to make"
        default = 1
}

variable "vm_storage_name" {
        description = "Storage Service Name"
        default = "azurestudystorage"
}

variable "vm_location" {
        description = "Server Location"
        default = "Japan East"
}

variable "vm_virtual_network" {
        desctiption = "Virtual Machine Virtual Network"
        default = "azurestudy-vnet"
}

variable "vm_subnet" {
        desctiption = "Virtual Machine Subnet"
        default = "Subnet-1"
}

variable "vm_size" {}
variable "vm_user" {}
variable "vm_pass" {}
variable "vm_image" {}
