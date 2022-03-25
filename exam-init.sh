openstack domain create ex210
openstack project create --domain ex210 engineering
openstack user create --domain ex210 --project engineering --project-domain ex210 --password redhat --email robert@gmail.com robert
openstack user create --domain ex210 --project engineering --project-domain ex210 --password redhat --email george@gmail.com george
openstack user create --domain ex210 --project engineering --project-domain ex210 --password redhat --email william@gmail.com william
openstack role add --user robert --project engineering --project-domain ex210 --user-domain ex210 admin
openstack role add --user george --project engineering --project-domain ex210 --user-domain ex210 admin
openstack role add --user william --project engineering --project-domain ex210 --user-domain ex210 member
openstack network create engnet --project engineering
openstack network list --project engineering
openstack subnet create --subnet-range 192.168.10.0/24  --network  engnet eng-subnet --project engineering
openstack router create ex210-router --project engineering
neutron router-interface-add ex210-router eng-subnet
neutron router-gateway-set ex210-router provider-datacentre
openstack keypair create webkey > /home/stack/webkey.pem
chmod 600 /home/stack/webkey.pem
openstack security group create ssh --project engineering --project-domain ex210
openstack security group create web --project engineering --project-domain ex210
openstack security group rule create --protocol icmp ssh --project engineering --project-domain ex210
openstack security group rule create --protocol tcp --dst-port 22 ssh --project engineering --project-domain ex210
openstack security group rule create --protocol tcp --dst-port 80 web --project engineering --project-domain ex210
openstack flavor create --disk 10 --ram 2048 --vcpus 1 m1.petite
wget http://materials.example.com/osp-small.qcow2
openstack image create --disk-format qcow2 --file  osp-small.qcow2 --public web
tar -zcvf file1.tar.gz templates
wget https://raw.githubusercontent.com/vinodkaravati/openstack-practice/master/webserver.sh
wget https://raw.githubusercontent.com/vinodkaravati/openstack-practice/master/user-data.file
wget http://materials.example.com/heat/labserver-with-floatingip.yaml
