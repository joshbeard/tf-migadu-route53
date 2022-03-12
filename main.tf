# ------------------------------------------------------------------------------
# route53 (dns) records for mail
# ------------------------------------------------------------------------------

#
# ==== MX
#
resource "aws_route53_record" "site-mx" {
  zone_id = var.zone_id
  name    = var.domain
  type    = "MX"
  ttl     = 3600
  records = ["10 aspmx1.migadu.com","20 aspmx2.migadu.com"]
}

#
# ==== TXT (spf, verification)
#
resource "aws_route53_record" "site-txt" {
  zone_id = var.zone_id
  name    = var.domain
  type    = "TXT"
  ttl     = 300
  records = compact(concat([
      "hosted-email-verify=${var.migadu_verify}",
      "v=spf1 include:spf.migadu.com -all"
  ], var.txt_records))
}

#
# ==== DMARC
#
resource "aws_route53_record" "site-dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${var.domain}"
  type    = "TXT"
  ttl     = 3600
  records = ["v=DMARC1; p=quarantine"]
}

#
# ==== DKIM
#
resource "aws_route53_record" "site-dkim-1" {
  zone_id = var.zone_id
  name    = "key1._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = 3600
  records = ["key1.${var.domain}._domainkey.migadu.com"]
}
resource "aws_route53_record" "site-dkim-2" {
  zone_id = var.zone_id
  name    = "key2._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = 3600
  records = ["key2.${var.domain}._domainkey.migadu.com"]
}
resource "aws_route53_record" "site-dkim-3" {
  zone_id = var.zone_id
  name    = "key3._domainkey.${var.domain}"
  type    = "CNAME"
  ttl     = 3600
  records = ["key3.${var.domain}._domainkey.migadu.com"]
}

resource "aws_route53_record" "site-autoconfig" {
  zone_id = var.zone_id
  name    = "autoconfig.${var.domain}"
  type    = "CNAME"
  ttl     = 3000
  records = ["autoconfig.migadu.com"]
}

resource "aws_route53_record" "site-autodiscover" {
  zone_id = var.zone_id
  name    = "_autodiscover._tcp.${var.domain}"
  type    = "SRV"
  ttl     = 3000
  records = ["0 1 443 autodiscover.migadu.com."]
}

resource "aws_route53_record" "site-submissions" {
  zone_id = var.zone_id
  name    = "_submissions._tcp.${var.domain}"
  type    = "SRV"
  ttl     = 3000
  records = ["0 1 465 smtp.migadu.com."]
}

resource "aws_route53_record" "site-imaps" {
  zone_id = var.zone_id
  name    = "_imaps._tcp.${var.domain}"
  type    = "SRV"
  ttl     = 3000
  records = ["0 1 993 imap.migadu.com."]
}

resource "aws_route53_record" "site-pop3s" {
  zone_id = var.zone_id
  name    = "_pip3s._tcp.${var.domain}"
  type    = "SRV"
  ttl     = 3000
  records = ["0 1 995 pip.migadu.com."]
}