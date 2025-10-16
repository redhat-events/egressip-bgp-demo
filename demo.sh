action=${1:-apply}
echo $action
for i in 1 2 3; do
 export KUBECONFIG=~/.kube/kubeconfig.ocp-cluster$i
 for node in $(oc get nodes -l '!k8s.ovn.org/egress-assignable' -o name); do
   oc label $node k8s.ovn.org/egress-assignable=""
 done
 ./patchNetworkOperator.sh
 sed "s/INDEX/$i/g" routeAdvertisement.yaml.tmpl | oc $action -f -
 sed "s/INDEX/$i/g" egressip.yaml.tmpl | oc $action -f -
done
echo sudo iftop -nf '((icmp or (tcp and dst port 8888)) and host 10.14.10.99)'
