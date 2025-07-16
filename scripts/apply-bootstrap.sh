#!/usr/bin/env bash
set -euo pipefail

# 1) Comprueba si recibimos la flag --debug
DEBUG_MODE=false
for arg in "$@"; do
  case "$arg" in
    --debug) DEBUG_MODE=true ;;
  esac
done

# 1) Ajusta según tu perfil y región
export AWS_DEFAULT_REGION="us-east-2"
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

get_secrets() {
  echo "Fetching tls_cert_mabecenter..."
  DB_URL=$(get_ssm_param "db_url_sync_db" true)
}

save_secrets() {
  cat > "$TFVARS" <<EOF
db_url = "${DB_URL}"
EOF
}

if [ "$DEBUG_MODE" = true ]; then
TFVARS=aws.s3.tfvars
  # Si ya existe el tfvars, simplemente lo usas
  if [ -f "$TFVARS" ]; then
    echo "Usando tfvars existente: $TFVARS"
  else
    echo "Generando tfvars en modo DEBUG: $TFVARS"
    get_secrets
    save_secrets
  fi
  terraform init -upgrade
  export TF_LOG=DEBUG
  export TF_LOG_PATH=terraform-debug.log
  terraform apply -var-file=aws.s3.tfvars
else
  get_secrets
  terraform init -upgrade
  terraform apply \
    -var="db_url=${DB_URL}"
fi
