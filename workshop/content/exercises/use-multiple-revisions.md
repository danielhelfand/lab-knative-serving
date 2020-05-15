You have now created a Knative `Service` that has multiple `Revisions`. One example of how 
to make use of multiple `Revisions` is to split how requests are routed to each `Revision`. 

If you remember from the previous section, the `TRAFFIC` property for the latest `Revision` is 
currently set to `100%`, meaning the only response from your `Service` will be `Hello Go Sample v2!`. 

To split the incoming requests to your `Service` between both of its `Revisions`, run the following 
command to grab the name of the first `Revision` for `helloworld-go`:

{% raw %}
```execute-1
FIRST_REVISION=`kn revision list -o jsonpath="{range .items[1]}{.metadata.name}{\"\\n\"}{end}"`
```
{% endraw %}

Confirm the `Revision` name was properly captured by the above command:

```execute-1
echo $FIRST_REVISION
```

Now you can update `helloworld-go` by using the `--traffic` flag from `kn service update` to 
update how requests are routed to each `Revision`. Run the command below to designate that 
traffic should be split equally between the two `Revisions`:

```execute-1
kn service update helloworld-go --traffic $FIRST_REVISION=50,@latest=50
```

The `@latest=50` part of the argument to the `--traffic` flag is used to specify that the most 
recent `Revision` will receive 50% of requests made to the `helloworld-go` `Service`. `$FIRST_REVISION=50` 
means that the first `Revision` will receive the other 50%.

Running the command below to list `Revisions`, you can see how the `TRAFFIC` column now shows `50%` 
for each `Revision`:

```execute-1
kn revision list
```

In the lower terminal, test to see if the traffic is being equally split. What should happen is that 
half of the requests sent to `helloworld-go` return `Hello Go Sample v1!` and the other half will 
return `Hello Go Sample v2!`.

Run this script that will issue ten requests to `helloworld-go` and note what responses are returned:

```execute-2
sh /home/eduk8s/workshop/content/exercises/requests.sh
```

You will see a roughly even split of responses returned between the `v1` and `v2` version of the application 
response. While your results may not be exactly a 50% split, the results would get close to a true 50/50 split 
with more request samples.

Click **Workshop Summary** to find more information about the Knative project and finish this tutorial.