module "dns_zone" {
  source  = "FlexibleEngineCloud/dns/flexibleengine"
  version = "1.0.0"

  domain_name        = "mydomain.org"
  domain_description = "A domain for mydomain"
  domain_admin_email = "admin@mydomain.org"
  zone_type          = "public"

  dns_recordsets = [
    {
      name        = "www1"
      description = "A DNS entry for www1"
      ttl         = 3000
      type        = "A"
      records     = ["PUBLIC_IP_ADDRESS"]
    },
    {
      name        = "www2"
      description = "A DNS entry for www2"
      ttl         = 3000
      type        = "A"
      records     = ["PUBLIC_IP_ADDRESS_1", "PUBLIC_IP_ADDRESS_2"]
    }
  ]
}
