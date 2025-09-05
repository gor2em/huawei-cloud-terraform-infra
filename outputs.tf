// --- Network outputs ---
output "vpc_id" {
  value       = huaweicloud_vpc.this.id
  description = "ID of the created VPC"
}

output "subnet_ids" {
  value       = { for k, s in huaweicloud_vpc_subnet.this : k => s.id }
  description = "Map of subnet IDs keyed by subnet name"
}

output "nat_id" {
  value       = huaweicloud_nat_gateway.this.id
  description = "ID of the NAT Gateway"
}

output "snat_rule_ids" {
  value       = { for k, r in huaweicloud_nat_snat_rule.pods : k => r.id }
  description = "SNAT Rule IDs for pod subnets"
}


// --- ELB outputs ---
output "elb_id" {
  description = "The ID of the ELB"
  value       = huaweicloud_lb_loadbalancer.ingress_elb.id
}

output "eip_addresses" {
  value = { for k, e in huaweicloud_vpc_eip.this : k => e.address }
}
