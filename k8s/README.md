# K8s Commands

``` bash
# Create deployment and service
kubectl create deployment hello-minikube --image=k8s.gcr.io/echoserver:1.4
kubectl expose deployment hello-minikube --type=LoadBalancer --port=8080

# Apply Manifest
kubectl apply -f deployment.yaml
```