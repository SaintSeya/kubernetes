#step 1 install packages
echo step 1 install packages
echo ======================
sudo apt-get update
sudo apt-get install curl -y
sudo apt-get install virtualbox -y
sudo apt-get install dbus-x11 -y
sudo apt-get install openjdk-8-jre -y
sudo apt-get install maven -y
sudo apt-get install docker.io -y
sudo apt-get install git -y
sudo usermod -G docker dbaasadmin
sleep 5
#step 2 install minikube
echo step 2 install minikube
echo ======================
sudo curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.31.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube -y
sleep 10
sudo chmod 775 /usr/local/bin/minikube
sudo curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.10.0/bin/linux/amd64/kubectl && chmod +x kubectl && sudo cp kubectl /usr/local/bin/ && rm kubectl -y
sudo chmod 775 /usr/local/bin/kubectl
source ~/.bashrc
sleep 5
#step 3 startup minicube
echo step 3 startup minicube
echo ======================
minikube start
minikube status
sleep 15
kubectl cluster-info
minikube stop
sleep 30
VBoxManage modifyvm "minikube" --memory 5120
echo VM MEMORY SIZE
vboxmanage showvminfo minikube |grep Memory
VBoxManage list vms
#sleep 60
#VBoxManage controlvm "minikube" reset
sleep 30
minikube start
#step 4 deploy mysql images
echo ======================
echo step 4 deploy mysql images
cd DockerMysql
sh 0database_install.sh
sleep 30
kubectl get pods
cd ..
pwd
#step 5 deploy elastisearch
echo ======================
echo step 5 deploy elastisearchi
cd elasticsearch
sh 0service_kubectl_proxy.sh
sleep 10
sh 1elasticsearch-svc.sh
sleep 60
cd ..
pwd
#step 6 deploy App
echo ======================
echo step 6 deploy App
cd docker-mysql-spring-boot-example
sh 0app_install.sh
cd..
