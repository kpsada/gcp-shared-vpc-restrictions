resource "google_project_organization_policy" "host-project-restriction" {
  project = var.vpc.service_project_id
  constraint = "constraints/compute.restrictSharedVpcHostProjects"

  list_policy {
    allow {
      values = var.vpc.vpc_host_projects
    }
  }
}