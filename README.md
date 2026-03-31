# Agent Sandbox

The purpose of this repo is to experiment with running AI agents within Kubernetes
using the k8s SIG App [agent-sandbox](https://github.com/kubernetes-sigs/agent-sandbox)
project. The project uses KinD for locally running k8s clusters.

# Create a local cluster

To create a local cluster with the sandbox components install, run

```sh
make create-cluster
make install-sandbox
```

If this is successful, you should be able to run:

```sh
kubectl cluster-info --context kind-agent-sandbox
```

And see:

```sh
Kubernetes control plane is running at https://127.0.0.1:33035
CoreDNS is running at https://127.0.0.1:33035/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```
