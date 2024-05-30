
module "default_vpc" {
  source     = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc"
  project_id = module.main_project.project_id
  name       = "default"
  subnets = [{
    ip_cidr_range = "10.1.0.0/24"
    name          = "default"
    region        = var.region
    secondary_ip_range = {
      pods     = "10.16.0.0/14"
      services = "10.20.0.0/24"
    }
  }]
}

module "firewall" {
  source               = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-vpc-firewall"
  project_id           = module.main_project.project_id
  network              = module.default_vpc.name
  default_rules_config = {
    admin_ranges         = ["10.0.0.0/8"]
  }
  ingress_rules = {
    ntp-svc = {
      description          = "NTP service."
      direction            = "INGRESS"
      action               = "allow"
      sources              = []
      ranges               = [var.my_home_ip_address]
      targets              = []
      use_service_accounts = false
      rules                = [{ protocol = "tcp", ports = [22, 5432, 3389] }]
      extra_attributes     = {}
    }
  }
}

module "default_nat" {
  source         = "github.com/GoogleCloudPlatform/cloud-foundation-fabric/modules/net-cloudnat"
  project_id     = module.main_project.project_id
  region         = var.region
  name           = "default"
  router_network = module.default_vpc.self_link
}