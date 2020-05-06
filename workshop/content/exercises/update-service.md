Now that you have used your Knative `Service`. let's see what happens with 
`Revisions` when an update is made the `Service`.

The update will change the `TARGET` environment variable that is used by the 
application for `helloworld-go` to print `Hello Go Sample v1!`. 

Place a `watch` on the `Revisions` in your upper terminal:

```execute-1
watch kn revision list
```

The command below from `kn` will update the `TARGET` environment variable and update 
your `helloworld-go` `Service`. Change `TARGET` to `Hello Go Sample v2!` instead of 
`Hello Go Sample v1!`:

{% raw %}
```execute-2
kn service update helloworld-go --env TARGET="Go Sample v2"
```
{% endraw %}

After running the command to update the `Service`, you will see a new `Revision` is created 
in your top terminal. Of note, you will eventually see the `TRAFFIC` column has updated itself 
so that now `100%` of requests will be sent to the latest `Revision` of `helloworld-go`.

Once the `Revision` column `READY` is `True`, ping `helloworld-go` again to see if the application 
prints `Hello Go Sample v2!` now:

{% raw %}
```execute-2
curl $(kubectl get ksvc helloworld-go -o template --template '{{.status.address.url}}')
```
{% endraw %}

In the next section, you will learn how to make use of both `Revisions` that are part of your `Service`.

Stop the watch on the `Revisions` in your first terminal:

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

Click **Use More Than One Knative Revision** to continue.