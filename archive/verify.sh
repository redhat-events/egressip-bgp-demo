for i in 1 2 3; do
  export KUBECONFIG=~/.kube/kubeconfig.ocp-cluster$i
  for ns in prod nonprod; do
  oc get pods -n egress-service-$ns
  oc describe service -n egress-service-$ns | egrep -i 'Failed|Warning'
  oc describe egressservice -n egress-service-$ns | egrep -i 'Failed|Warning'
  done
done
