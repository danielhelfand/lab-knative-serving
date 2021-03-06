Now that you have learned about and seen all the parts of a Knative `Service`, it's 
time to see how it actually works. Go ahead a place a `watch` on a `kubectl get pods` 
command to see that no Pods are currently running in your namespace:

```execute-1
watch kubectl get pods
```

Upon creating your `Service`, a Pod hosting the container associated with your `Service` 
will be started up. If you see any Pods running as part of the output of the above command, 
wait for those Pods to stop running before running any more commands. 

Once you see a `No resources found` message confirming nothing is running, go ahead 
and make a request to the `helloworld-go` `Service` using the following `curl` command to 
ping the `Service`:

{% raw %}
```execute-2
curl $(kubectl get ksvc helloworld-go -o template --template '{{.status.address.url}}')
```
{% endraw %}

After issuing the request above, you will see a Pod starts running in your top terminal. This Pod 
is hosting the container from the image `gcr.io/knative-samples/helloworld-go` that was specified 
in the YAML file used to create the `helloworld-go` `Service`. 

In your bottom terminal, you will see a response from the application that is hosted by the 
container running in the Pod that was just created:

```
Hello Go Sample v1!
```

Knative `Serving` is able to scale up Pods based on how much traffic is coming to your `Service`, but 
it also scales down the number of Pods when there is less incoming traffic. 

Keep watching the top terminal until you see the `No resources found` message again. This confirms that 
your `Service` has scaled down the amount of Pods needed due to a lack of incoming traffic. After about a 
minute, the Pod will start terminating as indicated by its `STATUS` column and then no Pods will be available 
once again.

In the next section, you will make an update your `Service` to learn more about how `Revisions` work. 

Stop the watch on the Pods in your first terminal once none are running anymore:

```execute-1
<ctrl+c>
```

Clear your terminals:

```execute-1
clear
```

```execute-2
clear
```

Click **Update Service** to continue.