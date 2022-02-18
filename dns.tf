terraform {
  required_providers {
    dyn = {
      source  = "terraform.local/local/dyn"
      version = "1.0.0"
    }
  }
}


provider "dyn" {
}

locals {
  dyn_zone_name = "bngoytest.com"
}

module "dns_records" {
  source = "./dyn" 
  zone_name = local.dyn_zone_name
  recordsets = [
    { 
      # comments can be used to describe what each entry is. as well as owners.
      name    = "p1"
      type    = "NS"
      ttl     = 900
      records = [
        "ns-1083.awsdns-07.org.",
        "ns-710.awsdns-24.net.",
        "ns-2016.awsdns-60.co.uk.",
        "ns-268.awsdns-33.com.",
      ]
    },
  ]
}
