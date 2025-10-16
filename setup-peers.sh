export KUBECONFIG=~/.kube/kubeconfig.virt
static=/home/daniel/Downloads/iso/
mkdir -p $static
echo 'world' > $static/index.html
podman kill httpd-iso
podman run --rm -dt --name=httpd-iso -p 8888:8080 -v $static:/var/www/html:Z registry.access.redhat.com/ubi8/httpd-24

oc apply -f frr.vm.yaml
