#!/bin/bash
for i in `seq 1 10`;
do
    curl $(kubectl get ksvc helloworld-go -o template --template '{{.status.address.url}}')
done