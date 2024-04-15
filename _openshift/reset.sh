#!/bin/bash

# Reset / Delete all resources
oc delete route demo-express
sleep 1
oc delete service demo-express
sleep 1
oc delete deployment demo-express
sleep 1
oc delete buildConfig demo-express
sleep 1
oc delete is demo-express
# sleep 1
# oc delete is node:16-alpine