In this self-paced tutorial, you will learn about the Knative project and deploy 
your first application using Knative [custom resource definitions](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/) 
(CRDs). 

The Knative project is composed of two separate pieces:

`Serving`: Run serverless containers on Kubernetes, and takes care of 
the details of networking, autoscaling (even to zero), and revision tracking.

`Eventing`: Universal subscription, delivery, and management of events. Adds 
on to `Serving` by providing a producer and consumer model to trigger certain 
actions based on certain kinds of events.

These two pieces of the project help make it easier to create serverless 
workloads on Kubernetes and simplify the experience of developing applications 
with Kubernetes. 

To deploy your first application using Knative, this tutorial will mainly focus 
on aspects of `Serving`. In the next section, you will get the chance to learn 
about some of the custom resource definitions that Knative `Serving` provides.

Click **Knative Custom Resource Definitions** to continue.