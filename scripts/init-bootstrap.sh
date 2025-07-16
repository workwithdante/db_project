#!/usr/bin/env bash
set -euo pipefail

# 1) Comprueba si recibimos la flag --debug
DEBUG_MODE=false
for arg in "$@"; do
  case "$arg" in
    --debug) DEBUG_MODE=true ;;
  esac
done

DEFAULT_MODE=false
for arg in "$@"; do
  case "$arg" in
    --default) DEFAULT_MODE=true ;;
  esac
done

AWS_PROFILE="terraform-sso"

# 2) Función para leer un parámetro SSM (String o SecureString)
get_ssm_param() {
  local name=$1
  local decrypt_flag=${2:-false}

  if [ "$decrypt_flag" = true ]; then
    aws ssm get-parameter \
      --name "$name" \
      --with-decryption \
      --profile "$AWS_PROFILE" \
      --output text \
      --query "Parameter.Value"
  else
    aws ssm get-parameter \
      --name "$name" \
      --profile "$AWS_PROFILE" \
      --output text \
      --query "Parameter.Value"
  fi
}


if [ "$DEFAULT_MODE" = false ]; then
  # 3) Recupera los valores
  echo "Fetching iam_s3_profile..."
  IAM_S3_PROFILE=$(get_ssm_param "iam_s3_profile" false)
  echo $IAM_S3_PROFILE

  echo "Fetching iam_s3_bucket"
  IAM_S3_BUCKET=$(get_ssm_param "iam_s3_bucket" true)
  echo $IAM_S3_BUCKET

  IAM_S3_KEY="global/sync_db.tfstate"

  echo "Fetching iam_s3_region"
  IAM_S3_REGION=$(get_ssm_param "iam_s3_region" true)
  echo $IAM_S3_REGION
else
  IAM_S3_PROFILE="terraform-sso"
  IAM_S3_BUCKET="terraform-states-mabecenter"
  IAM_S3_KEY="global/sync_db.tfstate"
  IAM_S3_REGION="us-east-2"
fi

if [ "$DEBUG_MODE" = true ] && [ -f aws.s3.tfbackend ]; then
  cat > aws.s3.tfbackend <<EOF
profile = "${IAM_S3_PROFILE}"
bucket = "${IAM_S3_BUCKET}"
key = "${IAM_S3_KEY}"
region = "${IAM_S3_REGION}"
encrypt = true
acl = "bucket-owner-full-control"
skip_credentials_validation = true
EOF
  echo "📝 aws.s3.tfbackend created (DEBUG=true)"
  terraform init -reconfigure \
    -backend-config=aws.s3.tfbackend
else
  # 5) Ejecuta terraform init con backend-config dinámico
  terraform init -reconfigure \
    -backend-config="profile=${IAM_S3_PROFILE}" \
    -backend-config="bucket=${IAM_S3_BUCKET}" \
    -backend-config="key=${IAM_S3_KEY}" \
    -backend-config="region=${IAM_S3_REGION}" \
    -backend-config="encrypt=true" \
    -backend-config="acl=bucket-owner-full-control" \
    -backend-config="skip_credentials_validation=true"
fi