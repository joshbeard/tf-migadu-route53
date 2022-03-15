# tf-route53-migadu

Terraform module to manage Migadu Mail DNS records in Route53.

## Example

```terraform
module "jbeard_org_migadu_dns" {
    source        = "git@gitlab.com:joshbeard/tf-route53-migadu.git"
    domain        = "jbeard.org"
    zone_id       = module.jbeard_org_aws.route53_zone_id
    migadu_verify = "xjk432xa"
}
```

