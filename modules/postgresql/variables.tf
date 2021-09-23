variable "name" {
  description = "The name of the PostgreSQL cluster."
  type        = string
}

variable "description" {
  description = "The description of the PostgreSQL cluster."
  type        = string
  default     = "Single Node PostgreSQL."
}

variable "postgres_version" {
  type        = number
  default     = 12
  description = "PostgreSQL version."
}

variable "database_config_values" {
  description = "Database config map database:user"
  type = list(object({
    database   = string
    username   = string
    extensions = list(string)
    conn_limit = number
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
  default     = "b2.micro"
}

variable "environment" {
  description = "Deployment environment of the PostgreSQL cluster."
  type        = string
  default     = "PRODUCTION"
}

variable "network_name" {
  description = "The name of the network, to which the PostgreSQL cluster belongs."
  type        = string
  default     = "default"
}

variable "subnet_name" {
  description = "The name of the subnet, to which the PostgreSQL cluster belongs."
  type        = string
  default     = "default-ru-central1-a"
}

variable "yc_zone" {
  description = "Yandex cloud zone to deploy database."
  type        = string
  default     = "ru-central1-a"
}
