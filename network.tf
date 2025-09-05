// Create VPC
resource "huaweicloud_vpc" "this" {
  name = "${var.env}-${var.app_name}-${var.svc["vpc"]}"
  cidr = var.vpc_cidr
  tags = var.default_tags
}

// Create Subnets
resource "huaweicloud_vpc_subnet" "this" {
  for_each          = var.subnets
  name              = "${var.env}-${var.app_name}-${var.svc["subnet"]}-${each.key}"
  vpc_id            = huaweicloud_vpc.this.id
  cidr              = each.value.cidr
  availability_zone = each.value.az
  gateway_ip        = cidrhost(each.value.cidr, 1)
  tags              = var.default_tags
}

// --- EIP for NAT Gateway ---
resource "huaweicloud_vpc_eip" "nat" {
  publicip {
    type = var.eip_type
  }

  bandwidth {
    name        = "${var.env}-${var.app_name}-${var.svc["nat"]}-${var.svc["eip"]}"
    size        = var.eip_bandwidth_size
    share_type  = var.eip_share_type
    charge_mode = var.eip_charge_mode
  }

  tags = var.default_tags
}

// --- NAT Gateway (Pay-per-use, small spec) ---
resource "huaweicloud_nat_gateway" "this" {
  name          = "${var.env}-${var.app_name}-${var.svc["nat"]}"
  spec          = var.nat_spec //  1 = small
  vpc_id        = huaweicloud_vpc.this.id
  subnet_id     = huaweicloud_vpc_subnet.this["default"].id // default subnet
  charging_mode = var.charge_mode
  tags          = var.default_tags
}

// --- SNAT Rule for pod-a & pod-b subnets ---
resource "huaweicloud_nat_snat_rule" "pods" {
  for_each = { for k, s in var.subnets : k => s if contains(["pod-a", "pod-b"], k) } // only for pod-a and pod-b subnets

  nat_gateway_id = huaweicloud_nat_gateway.this.id
  subnet_id      = huaweicloud_vpc_subnet.this[each.key].id
  floating_ip_id = huaweicloud_vpc_eip.nat.id
}
