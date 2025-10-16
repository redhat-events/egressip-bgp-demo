oc delete pod -l demo=egress -A
oc delete -f egressip.yaml
oc delete -f bgp.yaml
