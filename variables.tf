// --- Credentials (prefer ENV vars) ---
variable "access_key" {
  description = "Huawei Cloud access key"
  type        = string
  sensitive   = true
  default     = ""
}

variable "secret_key" {
  description = "Huawei Cloud secret key"
  type        = string
  sensitive   = true
  default     = ""
}

// --- Environment & naming ---
variable "env" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "region" {
  description = "Huawei Cloud region (e.g., tr-west-1)"
  type        = string
}

variable "charge_mode" {
  description = <<EOT
Global charge mode applied to all services that support billing options.
- "postPaid"  = pay-per-use
- "prePaid"   = subscription
EOT
  type        = string
  default     = "postPaid"
}

// --- Tags ---
variable "default_tags" {
  description = "Default tags for all resources"
  type        = map(string)
}

// --- Service abbreviations (naming) ---
variable "svc" {
  description = "Service abbreviations for naming"
  type        = map(string)
}

// --- VPC & Subnets ---
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets keyed by name; each { cidr, az }"
  type = map(object({
    cidr = string
    az   = string
  }))
}

// --- EIP options ---
variable "eip_type" {
  description = "EIP line type (e.g., 5_bgp, 5_union, 5_telcom, 5_mobile)"
  type        = string
  default     = "5_bgp"
}

variable "eip_share_type" {
  description = "EIP bandwidth share type: PER (dedicated) or WHOLE (shared)"
  type        = string
  default     = "PER"
}

variable "eip_bandwidth_size" {
  description = "Default bandwidth size (Mbit/s) for all EIPs"
  type        = number
  default     = 300
}

variable "eip_charge_mode" {
  description = "Default bandwidth charge mode"
  type        = string
  default     = "traffic"
}

// --- NAT Gateway ---
variable "nat_spec" {
  description = "NAT Gateway spec (1=small, 2=medium, 3=large, 4=xl)"
  type        = number
  default     = 1
}
