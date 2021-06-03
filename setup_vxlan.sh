
gcloud compute instances add-metadata admin-cluster-master --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
ip addr add 10.200.0.3/24 dev vxlan0
ip link set up dev vxlan0
'

gcloud compute instances add-metadata admin-cluster-worker0 --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
ip addr add 10.200.0.4/24 dev vxlan0
ip link set up dev vxlan0
'

gcloud compute instances add-metadata admin-cluster-worker1 --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
ip addr add 10.200.0.5/24 dev vxlan0
ip link set up dev vxlan0
'

gcloud compute instances add-metadata admin-workstation --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
ip addr add 10.200.0.6/24 dev vxlan0
ip link set up dev vxlan0
'

gcloud compute instances add-metadata user-cluster-master0 --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
ip addr add 10.200.0.7/24 dev vxlan0
ip link set up dev vxlan0
'

gcloud compute instances add-metadata user-cluster-worker0 --zone $ZONE \
--metadata startup-script='set -x
ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
ip addr add 10.200.0.8/24 dev vxlan0
ip link set up dev vxlan0
'
