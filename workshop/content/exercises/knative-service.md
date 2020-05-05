A Knative `Service` helps to bring all the key pieces of Knative `Serving` 
together to support serverless applications and functions. An example `Service` 
is shown below:

```yaml
apiVersion: serving.knative.dev/v1 # Current version of Knative
kind: Service
metadata:
  name: helloworld-go # The name of the app
spec:
  template:
    spec:
      containers:
        - image: gcr.io/knative-samples/helloworld-go # The URL to the image of the app
          env:
            - name: TARGET # The environment variable printed out by the sample app
              value: "Go Sample v1"
```

The `name` of this `Service` is `helloworld-go`. The `template` property allows you 
define properties that are part of a [Pod Template](https://kubernetes.io/docs/concepts/workloads/pods/pod-overview/#pod-templates), 
which defines how Kubernetes Pods will be created to support the application for this 
`Service`. 

The application this `Service` will deploy can be found under the `containers` property 
of the `template`. This `Service` will create and scale Pods hosting a container with a 
sample go application found at `gcr.io/knative-samples/helloworld-go`.

The application hosted by the container will make use of an environment variable named 
`TARGET`. When a request is made to the application, the `value` of the environment 
variable `Go Sample v1` will be output by the application.

Create `helloworld-go`:

```execute-1
kubectl apply -f /home/eduk8s/knative/service.yaml
```

You just created a Knative `Service`. In the next section, you will get the chance to 
review what was created.

Clear your terminal:

```execute-1
clear
```

Click **Reviewing Your Knative Service** to continue.