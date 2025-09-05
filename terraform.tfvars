# Global variables Start
env      = "dev"
app_name = "myapp"
region   = "tr-west-1"

access_key = "NEDLXVY1JVZ5YORRS0GO"
secret_key = "5agQcJtMJFMyJVjMEkZZ0hzth0L9ydfqrdnS3Eam"

default_tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
}
############################################################################# Global variables End

# Service name abbreviations Start
svc = {
  vpc    = "vpc"
  subnet = "subnet"
  ecs    = "ecs"
  evs    = "evs"
  eip    = "eip"
  sg     = "sg"
  elb    = "elb"
  rds    = "rds"
  dcs    = "dcs"
  obs    = "obs"
  cce    = "cce"
  nat    = "natgw"
}
############################################################################# Service name abbreviations End

# Billing Mode Start
charge_mode     = "postPaid" # global billing (postPaid = pay-per-use, prePaid = subscription)
eip_charge_mode = "traffic"  # EIP bandwidth billing mode (traffic or bandwidth)
############################################################################# Billing Mode End


# EIP Start
eip_type           = "5_bgp"
eip_share_type     = "PER"
eip_bandwidth_size = 300

# Creating by default 3 EIPs: nat, elb (ingress), cce
eips = {
  nat = "nat"
  elb = "ingress"
  cce = "cce"
}
############################################################################# EIP End


# VPC and Subnets Start
vpc_cidr = "10.0.0.0/16"

subnets = {
  "default" = { cidr = "10.0.1.0/24", az = "tr-west-1a" }
  "node-a"  = { cidr = "10.0.2.0/24", az = "tr-west-1a" }
  "node-b"  = { cidr = "10.0.3.0/24", az = "tr-west-1b" }
  "pod-a"   = { cidr = "10.0.4.0/24", az = "tr-west-1a" }
  "pod-b"   = { cidr = "10.0.5.0/24", az = "tr-west-1b" }
  "data-a"  = { cidr = "10.0.6.0/24", az = "tr-west-1a" }
  "data-b"  = { cidr = "10.0.7.0/24", az = "tr-west-1b" }
}
############################################################################# VPC and Subnets End


# NAT Gateway Start
nat_spec = 1 # 1=small, 2=medium, 3=large, 4=xl
############################################################################# NAT Gateway End


# CCE K8s Start
cce_version      = "v1.31"
cce_flavor_id    = "cce.s1.small"
cce_network_type = "eni" # eni for turbo, overlay_l2 for standard
############################################################################# CCE K8s End

# CCE Nodepool Start
nodepools = {
  worker-a = {
    az     = "tr-west-1a"
    subnet = "node-a"
    # os       = "Ubuntu 24.04"
    os       = "EulerOS 2.9"
    flavor   = "x1.2u.4g"
    count    = 1
    password = "StrongPass!123"
  }
  worker-b = {
    az       = "tr-west-1b"
    subnet   = "node-b"
    os       = "EulerOS 2.9"
    flavor   = "x1.2u.4g"
    count    = 1
    password = "StrongPass!123"
  }
}
########################################################################## CCE Nodepool End
