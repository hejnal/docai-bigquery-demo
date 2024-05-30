## Note: The cloud resource nested object has only one output only field - serviceAccountId.
resource "google_bigquery_connection" "bq-connection" {
  connection_id = "bq-conn"
  project       = module.main_project.project_id
  location      = "eu"
  cloud_resource {}
}