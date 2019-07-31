# Building the container

- Build demo container
```
podman build -t bastion.example.com:5000/poc/net-toolbox -f Dockerfile.ubi

or

podman build -t bastion.example.com:5000/poc/net-toolbox -f Dockerfile.fedora
```

# Testing Multus in OCP4.1

- Create project for CNI configurations
```
oc new-project multinetwork-configs
```

- Update [multus-macvlan-config.yaml](multus-macvlan-config.yaml)

```
oc create -f multus-macvlan-conf.yaml
```

```
oc get network-attachment-definitions.k8s.cni.cncf.io

oc edit network-attachment-definitions.k8s.cni.cncf.io macvlan-conf
```

```
oc create -f multus-pod-demo.yaml
```