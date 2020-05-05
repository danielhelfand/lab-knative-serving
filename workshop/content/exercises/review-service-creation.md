In the previous section, you created a Knative `Service`. Run the following 
command to verify the `Service` is available:

```execute-1
kn service describe helloworld-go
```

You should see output similar to the following:

```
Name:       helloworld-go
Namespace:  deploy-your-first-application-using-knative-w01-s001
Age:        19m
URL:        http://helloworld-go.deploy-your-first-application-using-knative-w01-s001.example.com

Revisions:
  100%  @latest (helloworld-go-52ztg) [1] (19m)
        Image:  gcr.io/knative-samples/helloworld-go (at 5ea96b)

Conditions:
  OK TYPE                   AGE REASON
  ++ Ready                  19m
  ++ ConfigurationsReady    19m
  ++ RoutesReady            19m
```

The output above shows that this `Service` was created with a `Route`, which is the 
value of the `URL` property. You can confirm this `Route` was created with your `Service` 
by running the following command:

```execute-2
kn route list
```

The command output will show the same `URL` as the `Service` has. 

Under the `URL` property of the output from `kn service describe`, you will see a `Revisions` 
property that shows all the `Revisions` this `Service` has. Since this `Service` has never been 
updated because it was just created, it only has one `Revision`. 

You can confirm that only one `Revision` exists by running the following command:

```execute-2
kn revision list
```

You will notice from the output of `kn revision list` some important properties of this `Revision`, such 
as the `SERVICE` property denoting that this revision is associated with the `helloworld-go` `Service`. 

There is also a column called `TRAFFIC` that specifies what percentage of incoming requests to the 
`helloworld-go` `Service` will be routed to this `Revision`. In this case, `100%` of requests will go to 
this `Revision`. 

The last resource created by the `helloworld-go` `Service` is a `Configuration`. Go ahead and run the following 
command to confirm the `Configuration` was created:

```execute-2
kubectl get configuration
```

The output will show the name of the `Configuration` is the same as the name of the `Service`. The `LATESTCREATED` and 
`LATESTREADY` columns denote which `Revision` is the most recent for the `Service` and also which `Revision` is the 
most recent that is available. In this case, for both, the only `Revision` available for `helloworld-go` is both the 
most recent and available to handle requests.

In the next section, you will send requests to `helloworld-go` to see some of the features of Knative `Serving` in 
action. 

Clear your terminals:

```execute-1
clear
```

```execute-2
clear
```

Click **Use Knative Service** to continue.