#step 1 install persistent volumes
kubectl create -f 1mysql-pv.yaml
sleep 10
#step 2 install mysql pods from image mysql5.6
kubectl create -f 2mysql-deployment.yaml
sleep 300
#step 3 configure mysql to app
kubectl run mysql-client --image=mysql:5.6 -i --rm --restart=Never --\
  mysql -h mysql-standalone -ppassword <<EOF
create database test;
create user 'sa'@'%' identified by 'password';
grant all privileges on *.* to 'sa'@'%' identified by 'password' WITH GRANT OPTION;
flush privileges;
show databases;
show processlist;
EOF
