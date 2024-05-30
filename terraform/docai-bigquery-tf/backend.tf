terraform {
 backend "gcs" {
   bucket  = "<tf_state_project_id>"
   prefix  = "<usecase_id_prefix>/state"
 }
}
