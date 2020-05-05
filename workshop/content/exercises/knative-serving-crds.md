The Knative project introduces its own Kubernetes resources, which are an 
extension of the Kubernetes API. This means that Kubernetes does not offer 
these resources by default, but it is able to recognize these resources 
after installing Knative on a cluster. 

The cluster you are currently using has Knative installed on it and ready 
to use. You can view the resources for `Serving` by running the following 
command:

```execute-1
kubectl api-resources --api-group=serving.knative.dev 
```

You should see the following four resources returned:

```
NAME             SHORTNAMES      APIGROUP              NAMESPACED   KIND
configurations   config,cfg      serving.knative.dev   true         Configuration
revisions        rev             serving.knative.dev   true         Revision
routes           rt              serving.knative.dev   true         Route
services         kservice,ksvc   serving.knative.dev   true         Service
```

The CRDs above represent the `Serving` aspect of the Knative project. These `services`, 
`routes`, `revisions`, and `configurations` all work together to allow for the development 
of serverless applications and functions with Kubernetes.

In the next section, you will learn about each `Serving` resource and how they work together.

Clear your terminal:

```execute-1
clear
```

Click **Knative Custom Resource Definitions** to continue.