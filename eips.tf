variable "eips" {
  description = "EIP resources to create"
  type        = map(string)
  default = {
    nat       = "nat"
    elb       = "ingress"
    cce       = "cce"
    rds_psql  = "rds-psql"
    rds_mysql = "rds-mysql"
  }
}

resource "huaweicloud_vpc_eip" "this" {
  for_each = var.eips

  publicip {
    type = var.eip_type
  }

  bandwidth {
    name        = "${var.env}-${var.app_name}-${each.value}-${var.svc["eip"]}"
    size        = var.eip_bandwidth_size
    share_type  = var.eip_share_type
    charge_mode = var.eip_charge_mode
  }

  tags = var.default_tags
}
