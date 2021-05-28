export INSTALLER_BUCKET=$DEVSHELL_PROJECT_ID-apm-installers
export REGION=us-central1
export ZONE=$REGION-a
export PROJECT_NUMBER=$(gcloud projects list --filter="PROJECT_ID=$DEVSHELL_PROJECT_ID" --format="value(PROJECT_NUMBER)")
export TF_VAR_gcp_region=$REGION
export TF_VAR_gcp_zone=$ZONE
export TF_VAR_project_id=$DEVSHELL_PROJECT_ID
export TF_VAR_vm_sa=$PROJECT_NUMBER-compute@developer.gserviceaccount.com
export TF_VAR_ssh_pub_key=/home/$USER/.ssh/id_rsa.pub

