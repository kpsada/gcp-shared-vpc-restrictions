# GCP Shared VPC Restriction Org-Policy
This module update the organization policy for specified service project. 

### restrict-vpc-host-project module set the "constraints/compute.restrictSharedVpcHostProjects" constraint for "service_project_id"
It will take the "service_project_id" and "vpc_host_projects" input values from the "vpc.json" file and update the org-policy for "constraints/compute.restrictSharedVpcHostProjects" constraint

```bash
module "restrict-vpc-host-project" {
    count = length(local.json)
    source = "./modules/restrict-host-project"
    vpc = local.json[count.index]
}
```

### restrict-shared-vpc-subnetworks module set the "constraints/compute.restrictSharedVpcSubnetworks" constraint for "service_project_id"
t will take the "service_project_id" and "vpc_subnetworks" input values from the "vpc.json" file and update the org-policy for "constraints/compute.restrictSharedVpcSubnetworks" constraint
```bash
module "restrict-shared-vpc-subnetworks" {
    count = length(local.json)
    source = "./modules/restrict-shared-vpc-subnetworks"
    vpc = local.json[count.index]
}
```

### variable json file example
```json
[
{
      "service_project_id": "SHARED_PROJECT_ID",
      "vpc_host_projects": ["under:projects/SHARED_VPC_HOST_PROJECT_ID"],
      "vpc_subnetworks": ["projects/SHARED_VPC_HOST_PROJECT_ID/regions/REGION/subnetworks/SUBNET_NAME"]
}
]
```