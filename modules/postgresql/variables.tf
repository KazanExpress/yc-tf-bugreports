variable "name" {
  description = "The name of the PostgreSQL cluster."
  type        = string
}

variable "description" {
  description = "The description of the PostgreSQL cluster."
  type        = string
  default     = "Multi-Node PostgreSQL."
}

variable "postgres_version" {
  type        = number
  default     = 12
  description = "PostgreSQL version."
}

variable "databases" {
  description = "List of databases."
  type = list(object({
    name  = string
    owner = string
    extensions = list(object({
      name = string
    }))
    lc_collate = string
    lc_type    = string
  }))
}

variable "users" {
  description = "List of users."
  type = list(object({
    name       = string
    password = string
    conn_limit = number
    permissions = list(object({
      database_name = string
    }))
  }))
}

variable "database_password_length" {
  description = "The database password length."
  type        = number
  default     = 16
}

variable "log_min_duration_statement" {
  description = "Minimum statement duration to log."
  type        = number
  default     = -1
}

variable "disk_size" {
  description = "Volume of the storage available to a PostgreSQL host, in gigabytes."
  type        = number
  default     = 10
}

variable "disk_type_id" {
  description = "Type of the storage of PostgreSQL hosts."
  type        = string
  default     = "network-hdd"
}

variable "resource_preset_id" {
  description = "The ID of the preset for computational resources available to a PostgreSQL host."
  type        = string
  default     = "s3-c2-m8"
}

variable "environment" {
  description = "Deployment environment of the PostgreSQL cluster."
  type        = string
  default     = "PRODUCTION"
}

variable "yc_zone" {
  description = "Yandex cloud zone to deploy database."
  type        = string
  default     = "ru-central1-a"
}

variable "network_id" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = string
}

variable "zone_a" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = string
}

variable "zone_b" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = string
}

variable "cidr_zone_a" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = list(string)
}

variable "cidr_zone_b" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = list(string)
}
variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Inhibits deletion of the cluster"
}
