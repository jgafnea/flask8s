# jok8s

Jokes via Kubernetes.

## Installation and Usage

```sh
# Build image, push to cluster
docker build -t jgafnea/jok8s:1.0 app
minikube image load jgafnea/jok8s:1.0

# Apply manifest
minikube kubectl -- apply -f k8s/manifest.yaml

# Call service
minikube service --all --url
# http://192.168.49.2:30000

curl http://192.168.49.2:30000
# When you have a bladder infection, urine trouble.
```
