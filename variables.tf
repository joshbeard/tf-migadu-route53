variable "mx_records" {
  description = "List of MX records to use. Like '10 mx.foo.com'"
  type        = list
  default     = ["10 aspmx1.migadu.com","20 aspmx2.migadu.com"]
}

variable "migadu_dkim" {
  type    = string
  default = "Migadu dkim record"
}

variable "domain" {
  description = "The domain to create records for."
  type        = string
}

variable "zone_id" {
  description = "The Route53 zone id to manage records under."
  type        = string
}