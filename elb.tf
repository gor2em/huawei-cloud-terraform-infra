// --- ELB Load Balancer ---
resource "huaweicloud_lb_loadbalancer" "ingress_elb" {
  name          = "${var.env}-${var.app_name}-ingress-${var.svc["elb"]}"
  description   = "ELB for ${var.env}-${var.app_name}"
  vip_subnet_id = huaweicloud_vpc_subnet.this["data-a"].ipv4_subnet_id // ipv4_subnet_id of data-a subnet

  depends_on = [
    huaweicloud_vpc_subnet.this["data-a"]
  ]

  tags = var.default_tags
  #   charging_mode = var.charge_mode // default postPaid
}

resource "huaweicloud_vpc_eip_associate" "ingress_elb_assoc" {
  public_ip = huaweicloud_vpc_eip.this["elb"].address
  port_id   = huaweicloud_lb_loadbalancer.ingress_elb.vip_port_id
}
