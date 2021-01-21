variable "vpc" {
    type = object({
        service_project_id = string
        vpc_host_projects = list(string)
        vpc_subnetworks = list(string)
    })
}