# Openshift CLI

Use Template to perform the initial OpenShift setup and initial deployment.  Subsequent builds and deployments triggered by GitHub Actions.  Openshift token must be saved as a GitHub Action secret for this repo.  No GitHub ssh key or token needed for build since repo is public.

## Create/update node imagestream with 16-alpine
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

## Can inspect an image by running with shell
```bash
oc run mypod --image=demo-express -t -i --restart=Ne
ver --command -- sh

# Clear any completed pods
oc delete pod --field-selector=status.phase==Succeeded
```

## add redeploy trigger for when image changes
## Not needed with this template, already included
```bash
oc set triggers deploy/demo-express --from-image=demo-express:latest -c demo-express
```
