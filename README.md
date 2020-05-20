LAB - Knative Serving
=====================

This workshop teaches the fundamentals of using [Knative Serving](https://knative.dev/docs/serving/). It is based on the tutorial from 
the Knative project called [Getting Started with App Deployment](https://knative.dev/docs/serving/getting-started-knative-app/) with added 
sections and additional tools like the Knative CLI (`kn`).

In this workshop, you can expect to learn the following:
* High level overview of the Knative project
* A more in depth look at the pieces offered by Knative Serving 
* Deploying an application using a [Knative Service](https://knative.dev/docs/serving/spec/knative-api-specification-1.0/#service) to a Kubernetes cluster
* Updating the deployed Knative Service using `kn`
* Making use of multiple [`Revisions`](https://knative.dev/docs/serving/spec/knative-api-specification-1.0/#revision) of a Service

Installation
============

In order to use the workshop, you should have the eduk8s operator installed. For installation instructions for the eduk8s operator see:
* https://github.com/eduk8s/eduk8s-operator

You will also need to have Knative Serving installed on your cluster hosting this workshop, which can be done using `kubectl`/[`glooctl`](https://docs.solo.io/gloo/latest/getting_started/):

```
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-crds.yaml
kubectl apply --filename https://github.com/knative/serving/releases/download/v0.14.0/serving-core.yaml
glooctl install knative --install-knative=false
```

Installing the workshop can be done using the following command:

```
kubectl apply -k https://github.com/danielhelfand/lab-knative-serving
```

You can access the `trainingportal` to start up this workshop by running:

```
kubectl get trainingportal knative-serving
```

Using the `URL` property from the output of the above command, you can access the workshop from a browser, which will guide you 
through the process to begin the workshop.

Installation on Minikube
========================

If deploying to minikube, you can use the [`minikube.sh`](minikube.sh) script to install all dependencies and the workshop itself.