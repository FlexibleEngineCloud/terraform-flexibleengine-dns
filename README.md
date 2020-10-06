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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | A domain description | string | n/a | yes |
| dns\_recordsets |  | list | `<list>` | no |
| domain\_admin\_email | The domain administrator e-mail | string | n/a | yes |
| domain\_name | The domain name to be created | string | n/a | yes |
| domain\_ttl | The domain TTL | string | `"3000"` | no |
| region\_name | The Flexible Engine region name for a private domain zone | string | `""` | no |
| vpc\_id | The Flexible Engine VPC ID for a private domain zone | string | `""` | no |
| zone\_type | The domain type "private" or "public" | string | `"private"` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_zone\_id | The ID of the private zone |
| public\_zone\_id | The ID of the public zone |

