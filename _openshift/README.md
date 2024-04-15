# Openshift CLI

Use Template to perform the initial OpenShift setup and initial deployment.  Subsequent builds and deployments triggered by GitHub Actions.

## Create imagestream for node16
```bash
 oc import-image node:16-alpine --from=node:16-alpine --confirm
 oc set image-lookup imagestream/node   ## Allow local lookups
```

## Create everything using a template
```bash
oc process -f demo-express.yaml  |  oc apply -f -
```

## trigger an image build
```bash
oc start-build demo-express
```

## add redeploy trigger for when image changes
## Not needed with this template, already included
```bash
oc set triggers deploy/demo-express --from-image=demo-express:latest -c demo-express
```
