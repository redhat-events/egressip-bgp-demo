oc delete frrconfigurations.frrk8s.metallb.io -n openshift-frr-k8s --all
oc patch Network.operator.openshift.io/cluster --type=merge -p '{
  "spec": {
    "additionalRoutingCapabilities": {
      "providers": ["FRR"]
    }
  }
}'

oc patch Network.operator.openshift.io cluster --type=merge -p='{
"spec": {
  "additionalRoutingCapabilities": {
    "providers": ["FRR"]
    },
    "defaultNetwork": {
      "ovnKubernetesConfig": {
        "routeAdvertisements": "Enabled"
}}}}'
