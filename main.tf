locals {
  raw_json = file("${path.module}/vpc.json")
  json = jsondecode(local.raw_json) # Serialize our json to terraform object
}

module "restrict-vpc-host-project" {
    count = length(local.json)
    source = "./modules/restrict-host-project"
    vpc = local.json[count.index]
}

module "restrict-shared-vpc-subnetworks" {
    count = length(local.json)
    source = "./modules/restrict-shared-vpc-subnetworks"
    vpc = local.json[count.index]
}