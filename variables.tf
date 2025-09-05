// --- Credentials ---
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


// --- CCE Cluster ---
variable "cce_version" {
  description = "CCE cluster version (e.g., v1.30)"
  type        = string
  default     = "v1.31" // Optional, String, ForceNew) Specifies the cluster version, defaults to the latest supported version. Changing this parameter will create a new cluster resource.
}

variable "cce_flavor_id" {
  description = "CCE cluster flavor ID (e.g., cce.s1.small, cce.s1.medium, cce.s1.large)"
  type        = string
  default     = "cce.s1.small"

  /*
  https://registry.terraform.io/providers/huaweicloud/hcso/latest/docs/resources/cce_cluster
  Flavor ID options:
  cce.s1.small: small-scale single cluster (up to 50 nodes).
  cce.s1.medium: medium-scale single cluster (up to 200 nodes).
  cce.s2.small: small-scale HA cluster (up to 50 nodes).
  cce.s2.medium: medium-scale HA cluster (up to 200 nodes).
  cce.s2.large: large-scale HA cluster (up to 1000 nodes).
  cce.s2.xlarge: large-scale HA cluster (up to 2000 nodes).
  */

}

variable "cce_network_type" {
  description = "Container network type: overlay_l2, underlay, eni"
  type        = string
  default     = "eni" // VPC-CNI mode
}
