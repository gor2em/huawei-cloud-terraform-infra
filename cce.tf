// --- CCE Cluster ---
resource "huaweicloud_cce_cluster" "this" {
  name         = "${var.env}-${var.app_name}-${var.svc["cce"]}"
  cluster_type = "VirtualMachine" // ?
  flavor_id    = var.cce_flavor_id
  #   cluster_version        = var.cce_version // latest version by default
  vpc_id                 = huaweicloud_vpc.this.id
  subnet_id              = huaweicloud_vpc_subnet.this["node-a"].id
  container_network_type = var.cce_network_type
  eni_subnet_id = join(",", [
    huaweicloud_vpc_subnet.this["pod-a"].ipv4_subnet_id,
    huaweicloud_vpc_subnet.this["pod-b"].ipv4_subnet_id,
  ])
  eip = huaweicloud_vpc_eip.this["cce"].id

  depends_on = [
    huaweicloud_vpc_subnet.this["pod-a"],
    huaweicloud_vpc_subnet.this["pod-b"]
  ]

  tags = var.default_tags
}
