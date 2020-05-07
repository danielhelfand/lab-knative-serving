minikube addons enable ingress
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-core.yaml
glooctl install knative --install-knative=false
kubectl apply -k "github.com/eduk8s/eduk8s-operator?ref=master"
kubectl set env deployment/eduk8s-operator -n eduk8s INGRESS_DOMAIN=$(minikube ip).nip.io
kubectl apply -k https://github.com/danielhelfand/lab-knative-serving