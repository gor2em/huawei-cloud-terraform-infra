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

// --- EIP for ELB ---
resource "huaweicloud_vpc_eip" "ingress_elb" {
  publicip {
    type = var.eip_type
  }

  bandwidth {
    name        = "${var.env}-${var.app_name}-ingress-${var.svc["elb"]}"
    size        = var.eip_bandwidth_size
    share_type  = var.eip_share_type
    charge_mode = var.eip_charge_mode
  }

  tags = var.default_tags
}


// --- EIP for CCE ---
resource "huaweicloud_vpc_eip" "cce_eip" {
  publicip {
    type = var.eip_type
  }

  bandwidth {
    name        = "${var.env}-${var.app_name}-${var.svc["cce"]}-${var.svc["eip"]}"
    size        = var.eip_bandwidth_size
    share_type  = var.eip_share_type
    charge_mode = var.eip_charge_mode
  }

  tags = var.default_tags
}

