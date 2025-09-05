# --- Env & naming ---
env      = "dev"
app_name = "myapp"
region   = "tr-west-1"

access_key = ""
secret_key = ""

default_tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
}

# --- Service abbreviations ---
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

# --- Network ---
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

// --- EIP ---
# eip_bandwidth_size = 300
# eip_charge_mode    = "traffic"

# NAT Gateway
# nat_spec = 1 # small package
