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
