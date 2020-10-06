variable "domain_name" {
  description = "The domain name to be created"
}

variable "zone_type" {
  description = "Type of the zone, can be \"private\" or \"public\""
  validation {
    condition     = can(regex("private", var.zone_type)) || can(regex("public", var.zone_type))
    error_message = "The zone type must be \"private\" or \"public\"."
  }
}

variable "domain_admin_email" {
  description = "The domain administrator e-mail"
}

variable "domain_description" {
  description = "A domain description"
}

variable "domain_ttl" {
  description = "The domain TTL"
  default     = 3000
}

variable "region_name" {
  description = "The Flexible Engine region name for a private domain zone"
  default     = ""
}

variable "vpc_id" {
  description = "The Flexible Engine VPC ID for a private domain zone"
  default     = ""
}

variable "dns_recordsets" {
  type = list(object({
    name        = string
    description = string
    ttl         = number
    type        = string
    records     = list(string)
  }))
  default = []
}

