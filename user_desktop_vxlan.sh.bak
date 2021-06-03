sudo ip link add vxlan0 type vxlan id 42 dev ens4 dstport 4789
sudo bridge fdb append to 00:00:00:00:00:00 dst <AW0_IP> dev vxlan0
sudo bridge fdb append to 00:00:00:00:00:00 dst <AW1_IP> dev vxlan0
sudo bridge fdb append to 00:00:00:00:00:00 dst <AWS_IP> dev vxlan0
sudo bridge fdb append to 00:00:00:00:00:00 dst <AM_IP> dev vxlan0
sudo bridge fdb append to 00:00:00:00:00:00 dst <UC0_IP> dev vxlan0
sudo bridge fdb append to 00:00:00:00:00:00 dst <UC1_IP> dev vxlan0
sudo ip addr add 10.200.0.2/24 dev vxlan0
sudo ip link set up dev vxlan0