# How to create a cluster using kops close to the Door Dash configuration

Use kops to "create" a cluster.  kops is interesting as it like git.  You have a local concept or abstraction of a cluster.  You create this with kop create cluster....
I have document this is in run-kops.sh.

This creates a confiuration in an S3 bucket.  Then you have to use kops edit...  to make changes.  This is not really practical as I want the configuration in a local file checked into git.
This file is cluster-kops-1-20.yaml

So the life cycle is like this:
```
./run-kops.sh
kops replace -f cluster-kops-1-20.yaml
kops update cluster k8s-cluster.k8s.local
kops update cluster k8s-cluster.k8s.local --yes
```

this craetes the cluster and in a standard configuration

```./run-kops.sh```

This tells kops to replace the cluster configuration with what I have in this file.
this file is were I make changes to the configuration. e.g. add 200 nodes

```kops replace -f cluster-kops-1-20.yaml```

Kops now will update the physical cluster

```kops update cluster k8s-cluster.k8s.local```

but wait, the above really tells you what is about the change.
do the command again and tell it yes to update it

```kops update cluster k8s-cluster.k8s.local --yes```
