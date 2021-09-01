variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource in Azure (default: 'eastus', less expensive location)"
}

variable "application_full_name" {
  type        = string
  description = "Name of your project, application, product or service."
}

variable "application_short_name" {
  type        = string
  description = "Short name of your application using abbreviations or acronyms."
  validation {
    condition     = can(regex("^\\w+$", var.application_short_name))
    error_message = "Application short name can only consist of letters and numbers."
  }
}

variable "application_environment" {
  type        = string
  default     = "prod"
  description = "Name of the environment (example: dev, test, prod, ...)"
}

variable "contributors" {
  type        = list(string)
  description = "List of service principal Id (User, Group or Service Principal) to which contributor role will be assigned."
  default     = []
}