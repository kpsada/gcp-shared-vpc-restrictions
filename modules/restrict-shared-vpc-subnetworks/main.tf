resource "google_project_organization_policy" "vpc-subnet-restriction" {
  project = var.vpc.service_project_id
  constraint = "constraints/compute.restrictSharedVpcSubnetworks"	
  
  list_policy {
    allow {
      values = var.vpc.vpc_subnetworks
  }
}
}