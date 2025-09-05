// --- VPC & Subnets ---
output "vpc_id" {
  description = "VPC ID"
  value       = huaweicloud_vpc.this.id
}

output "subnet_ids" {
  description = "Subnet IDs by key (default, node-a, ...)"
  value       = { for k, s in huaweicloud_vpc_subnet.this : k => s.id }
}

output "subnet_ipv4_ids" {
  description = "IPv4 subnet IDs by key (used by ELB/CCE)"
  value       = { for k, s in huaweicloud_vpc_subnet.this : k => s.ipv4_subnet_id }
}

// --- Elastic IPs ---
output "eip_ids" {
  description = "EIP resource IDs by purpose"
  value       = { for k, e in huaweicloud_vpc_eip.this : k => e.id }
}

output "eip_addresses" {
  description = "EIP addresses by purpose"
  value       = { for k, e in huaweicloud_vpc_eip.this : k => e.address }
}

output "eip_nat_address" {
  description = "Public IP used by NAT Gateway SNAT"
  value       = try(huaweicloud_vpc_eip.this["nat"].address, null)
}

output "eip_elb_address" {
  description = "Public IP associated to the Ingress ELB"
  value       = try(huaweicloud_vpc_eip.this["elb"].address, null)
}

output "eip_cce_address" {
  description = "Public IP attached to the CCE API endpoint"
  value       = try(huaweicloud_vpc_eip.this["cce"].address, null)
}

// --- NAT Gateway ---
output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = huaweicloud_nat_gateway.this.id
}

output "nat_snat_rule_ids" {
  description = "SNAT Rule IDs for pod subnets"
  value       = { for k, r in huaweicloud_nat_snat_rule.pods : k => r.id }
}

// --- ELB ---
output "elb_id" {
  description = "Ingress ELB ID"
  value       = huaweicloud_lb_loadbalancer.ingress_elb.id
}

output "elb_vip_address" {
  description = "Ingress ELB VIP address (private)"
  value       = huaweicloud_lb_loadbalancer.ingress_elb.vip_address
}

output "elb_vip_port_id" {
  description = "Ingress ELB VIP port ID"
  value       = huaweicloud_lb_loadbalancer.ingress_elb.vip_port_id
}

// --- CCE Cluster ---
output "cce_cluster_id" {
  description = "CCE cluster ID"
  value       = huaweicloud_cce_cluster.this.id
}

output "cce_cluster_name" {
  description = "CCE cluster name"
  value       = huaweicloud_cce_cluster.this.name
}

// --- CCE Node Pools ---
output "nodepool_ids" {
  description = "CCE Node Pool IDs"
  value       = { for k, np in huaweicloud_cce_node_pool.this : k => np.id }
}
