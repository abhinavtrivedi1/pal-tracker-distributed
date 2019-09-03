#!/bin/sh
for i in 1 2 3 4 5
do
  echo "Looping ... number $i"

 curl -i -XPOST -H"Content-Type: application/json" https://registration-pal-e4c33492-cd46-11e9-b66e-5bb596fd3a6d.apps.evans.pal.pivotal.io/registration -d'{"name": "Pete"'+i+'}'
 curl -i localhost:8083/accounts?ownerId=1
 curl -i -XPOST -H"Content-Type: application/json" localhost:8083/projects -d"{\"name\": \"Project A\", \"accountId\": \"1\"}"
 curl -i -XPOST -H"Content-Type: application/json" localhost:8083/projects -d"{\"name\": \"Project B\", \"accountId\": \"1\"}"
 curl -i -XPOST -H"Content-Type: application/json" localhost:8081/allocations/ -d"{\"projectId\": \""+i+"\", \"userId\": \"1\", \"firstDay\": \"2015-05-17\", \"lastDay\": \"2015-05-18\"}"
 curl -i -XPOST -H"Content-Type: application/json" localhost:8081/allocations/ -d"{\"projectId\": \""+i+1+"\"\", \"userId\": \"1\", \"firstDay\": \"2015-05-17\", \"lastDay\": \"2015-05-18\"}"
done
