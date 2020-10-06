resource "flexibleengine_dns_zone_v2" "public_zone" {
  count       = var.zone_type == "public" ? 1 : 0
  name        = "${var.domain_name}."
  email       = var.domain_admin_email
  description = var.domain_description
  ttl         = var.domain_ttl
  zone_type   = "public"

}

resource "flexibleengine_dns_zone_v2" "private_zone" {
  count       = var.zone_type == "private" ? 1 : 0
  name        = "${var.domain_name}."
  email       = var.domain_admin_email
  description = var.domain_description
  ttl         = var.domain_ttl
  zone_type   = "private"

  router {
    router_region = var.region_name
    router_id     = var.vpc_id
  }
}

locals {

  dns_recordsets_keys   = [for recordset in var.dns_recordsets : recordset.name]
  dns_recordsets_values = [for recordset in var.dns_recordsets : recordset]
  dns_recordsets_map    = zipmap(local.dns_recordsets_keys, local.dns_recordsets_values)

}

resource "flexibleengine_dns_recordset_v2" "recordset" {
  for_each = local.dns_recordsets_map

  zone_id     = var.zone_type == "private" ? flexibleengine_dns_zone_v2.private_zone[0].id : flexibleengine_dns_zone_v2.public_zone[0].id
  name        = "${each.key}.${var.domain_name}."
  description = each.value.description
  ttl         = each.value.ttl
  type        = each.value.type
  records     = each.value.records

}
