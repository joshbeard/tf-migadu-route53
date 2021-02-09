# tf-route53-migadu

Terraform module to manage Migadu Mail DNS records in Route53.

```terraform
module "jbeard_org_migadu_dns" {
    source      = "git@gitlab.com:joshbeard/tf-route53-migadu.git"
    mx_records  = ["10 aspmx1.migadu.com","20 aspmx2.migadu.com"]
    migadu_dkim = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
    zone_id     = module.jbeard_org_aws.zone_id
}
```
