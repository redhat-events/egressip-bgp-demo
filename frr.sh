ssh rhel@10.14.10.98 -i ~/Documents/project/infrastructure/openshift-installation/2023/acm/id_rsa '
for cmd in "show i bgp summary" "show ip bgp" "show bfd peers"; do
echo; echo "------------------- Running: vtysh -c \"$cmd\" -----------------";
  sudo vtysh -c "$cmd"; 
done'

exit 0
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.13 advertised-routes"
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.14 advertised-routes"
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.15 advertised-routes"
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.13 routes"
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.14 routes"
sudo vtysh -c "show bgp ipv4 unicast neighbors 10.14.10.15 routes"

# ssh rhel@10.14.10.98 -i ~/Documents/project/infrastructure/openshift-installation/2023/acm/id_rsa 'ping -c 1 10.14.10.13'
# ssh rhel@10.14.10.98 -i ~/Documents/project/infrastructure/openshift-installation/2023/acm/id_rsa 'ping -c 1 10.14.10.14'
# ssh rhel@10.14.10.98 -i ~/Documents/project/infrastructure/openshift-installation/2023/acm/id_rsa 'ping -c 1 10.14.10.15'
# tcpdump -nni eth0 'tcp port 179'
