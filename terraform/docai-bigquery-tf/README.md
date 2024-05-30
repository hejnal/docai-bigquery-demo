## Terraform template for new engagements

Replace the *<project_name>* tag in the `main.tf` and `backend.tf` files by running the following command inside the current folder:
```bash
egrep -rl '<project_name>' ./ | grep -v README.md | xargs -I@ sed -i '' "s/<project_name>/$(basename "$PWD")/g" @
```

project_name will be replaced with the folder name.

And then run:
```bash
terraform init
terraform plan
terraform apply
```

To impersonate a SA to run all the IaC operations please set the following env variable:
```bash
export GOOGLE_IMPERSONATE_SERVICE_ACCOUNT=YOUR_SERVICE_ACCOUNT@YOUR_PROJECT.iam.gserviceaccount.com
```