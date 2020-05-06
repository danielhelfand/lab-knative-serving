LAB - Knative Fundamentals
==========================

This workshop is a work in progress. It aims to teach the fundamentals of using [Knative Serving](https://knative.dev/).

In order to use the workshop, you should have the eduk8s operator installed. For installation instructions for the eduk8s operator see:
* https://github.com/eduk8s/eduk8s-operator

You will need to have Knative Serving installed on your cluster hosting this workshop:

```
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-core.yaml
glooctl install knative --install-knative=false
```