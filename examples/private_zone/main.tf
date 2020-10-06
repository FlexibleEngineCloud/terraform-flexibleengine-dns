module "dns_zone" {
  source  = "FlexibleEngineCloud/dns/flexibleengine"
  version = "1.0.0"

  domain_name        = "mydomain.org"
  domain_description = "A domain for mydomain"
  domain_admin_email = "admin@mydomain.org"
  zone_type          = "private"
  region_name        = "eu-west-0"
  vpc_id             = "YOUR_VPC_ID"

  dns_recordsets = [
    {
      name        = "www1"
      description = "A DNS entry for www1"
      ttl         = 3000
      type        = "A"
      records     = ["10.0.0.1"]
    },
    {
      name        = "www2"
      description = "A DNS entry for www2"
      ttl         = 3000
      type        = "A"
      records     = ["10.0.0.2", "10.0.0.3"]
    }
  ]
}
