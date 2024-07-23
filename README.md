# jok8s

Jokes via Kubernetes.

## Install

```sh
# Build Docker image
docker build -t jgafnea/jok8s:1.0 app

# Deploy with Terraform
cd infra/terraform
terraform init
terraform apply

# Deploy with Minikube
minikube image load jgafnea/jok8s:1.0
minikube kubectl -- apply -f infra/kubectl/manifest.yaml
```

## Usage

```sh
# Call service
minikube service --all --url
# http://192.168.49.2:30000

curl http://192.168.49.2:30000
# When you have a bladder infection, urine trouble.
```
