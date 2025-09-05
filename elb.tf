# ELB Start (ingress elb)
resource "huaweicloud_lb_loadbalancer" "ingress_elb" {
  name          = "${var.env}-${var.app_name}-ingress-${var.svc["elb"]}"
  description   = "ELB for ${var.env}-${var.app_name}"
  vip_subnet_id = huaweicloud_vpc_subnet.this["data-a"].ipv4_subnet_id

  depends_on = [
    huaweicloud_vpc_subnet.this["data-a"]
  ]

  tags = var.default_tags
}
############################################################################# ELB End

# ELB EIP Association Start (ingress elb eip association)
resource "huaweicloud_vpc_eip_associate" "ingress_elb_assoc" {
  public_ip = huaweicloud_vpc_eip.this["elb"].address
  port_id   = huaweicloud_lb_loadbalancer.ingress_elb.vip_port_id
}
############################################################################# ELB EIP Association End
