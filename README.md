# Flexible Engine DNS Zone Terraform Module
---

```hcl
module "dns_zone" {
  source = "modules/terraform-fe-dns"

  domain_name        = "mydomain.org"
  description        = "A domain for mydomain"
  domain_admin_email = "admin@mydomain.org"
  zone_type          = "public"

  dns_recordsets = [
    {
      name        = "www1"
      description = "A DNS entry for www1"
      ttl         = "3000"
      type        = "A"
      records 	  = ["10.0.0.1"]
    },
    {
      name        = "www2"
      description = "A DNS entry for www2"
      ttl         = "3000"
      type        = "A"
      records 	  = ["10.0.0.2", "10.0.0.3"]
    }
  ]
}
```
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| flexibleengine | ~> 1.16 |

## Providers

| Name | Version |
|------|---------|
| flexibleengine | ~> 1.16 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dns\_recordsets | n/a | <pre>list(object({<br>    name        = string<br>    description = string<br>    ttl         = number<br>    type        = string<br>    records     = list(string)<br>  }))</pre> | `[]` | no |
| domain\_admin\_email | The domain administrator e-mail | `any` | n/a | yes |
| domain\_description | A domain description | `any` | n/a | yes |
| domain\_name | The domain name to be created | `any` | n/a | yes |
| domain\_ttl | The domain TTL | `number` | `3000` | no |
| region\_name | The Flexible Engine region name for a private domain zone | `string` | `""` | no |
| vpc\_id | The Flexible Engine VPC ID for a private domain zone | `string` | `""` | no |
| zone\_type | Type of the zone, can be "private" or "public" | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| zone\_id | The zone ID |
