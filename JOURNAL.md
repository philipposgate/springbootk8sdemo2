# Developer's Journal

## October 16, 2022 - Philip Posgate

In **CHAPTER 2** we'll continue to expand the API's definitions in the kustomize yaml files (aka: the Kubernetes manifest). 

Previously I used kubectl to generate the **deployment.yaml** file, and that file was enough to make a basic deployment.  Now we have to setup the Kustomize yaml files properly.

The following is an example of how the ```kubernetes``` directory structure should look like...

```
/kubernetes
├── base
│   ├── deployment.yaml
│   ├── hpa.yaml
│   ├── kustomization.yaml
│   └── service.yaml
└── overlays
    ├── dev
    │   ├── hpa.yaml
    │   └── kustomization.yaml
    ├── production
    │   ├── hpa.yaml
    │   ├── kustomization.yaml
    │   ├── rollout-replica.yaml
    │   └── service-loadbalancer.yaml
    └── staging
        ├── hpa.yaml
        ├── kustomization.yaml
        └── service-nodeport.yaml
```

...so above you have a **base** configuration that defines those configs which are common to all environments.  And then you have environment specific **overlays** which extend or override the base config.

The only yaml file that's mandatory is the ```kustomization.yaml``` file. It has to be created in the **base** directory, and also in each **overlay** directory.  All the other yaml files are used in reference from the kustomization.yaml file.  

In order to deploy to a particular environment, you execute ```kubectl apply -f <thePathToMyOverlay>```.

e.g. to deploy to "dev"
```
$ kubectl apply -f kubernetes/overlays/dev
```

e.g. to deploy to "production"
```
$ kubectl apply -f kubernetes/overlays/production
```

