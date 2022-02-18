# dyn provider
Sadly the [terraform-provider-dyn](https://github.com/hashicorp/terraform-provider-dyn) has archived. As a result it is easier to clone, build, and use it as a local provider. The following steps will achieve that 

```
git clone https://github.com/hashicorp/terraform-provider-dyn.git
cd terraform-provider-dyn
make build

# copy the built binary to local providers folder
# on mac:

cp $GOPATH/go/bin/terraform-provider-dyn  $HOME/.terraform.d/plugins/terraform.local/local/dyn/1.0.0/darwin_amd64/terraform-provider-dyn_v1.0.0
```

I created a test zone in dyndns named `bngoytest.com`
The following steps create a record similar to `p1` in the zone `bngoytest.com`

```
terraform init
terraform plan
```

The terraform resulting terraform plan looks like

```
  # module.dns_records.dyn_record.this["p1 NS ns-1083.awsdns-07.org."] will be created
  + resource "dyn_record" "this" {
      + fqdn  = (known after apply)
      + id    = (known after apply)
      + name  = "p1"
      + ttl   = "900"
      + type  = "NS"
      + value = "ns-1083.awsdns-07.org."
      + zone  = "bngoytest.com"
    }

  # module.dns_records.dyn_record.this["p1 NS ns-2016.awsdns-60.co.uk."] will be created
  + resource "dyn_record" "this" {
      + fqdn  = (known after apply)
      + id    = (known after apply)
      + name  = "p1"
      + ttl   = "900"
      + type  = "NS"
      + value = "ns-2016.awsdns-60.co.uk."
      + zone  = "bngoytest.com"
    }

  # module.dns_records.dyn_record.this["p1 NS ns-268.awsdns-33.com."] will be created
  + resource "dyn_record" "this" {
      + fqdn  = (known after apply)
      + id    = (known after apply)
      + name  = "p1"
      + ttl   = "900"
      + type  = "NS"
      + value = "ns-268.awsdns-33.com."
      + zone  = "bngoytest.com"
    }

  # module.dns_records.dyn_record.this["p1 NS ns-710.awsdns-24.net."] will be created
  + resource "dyn_record" "this" {
      + fqdn  = (known after apply)
      + id    = (known after apply)
      + name  = "p1"
      + ttl   = "900"
      + type  = "NS"
      + value = "ns-710.awsdns-24.net."
      + zone  = "bngoytest.com"
    }

Plan: 4 to add, 0 to change, 0 to destroy.
```

a `terraform apply` will create the `p1` node if it doesn't exist, as well as the records mentioned above