kubectl create -f 0users-mysql.yml
sleep 30
kubectl create -f 1users-mysql-repl-controller.yml
sleep 30
kubectl create -f 2users-mysql-nodeport-service.yml
sleep 30
kubectl create -f 3users-mysql-healthcheck.yml
sleep 30
kubectl create -f 4nginx-ingress-controller.yml
sleep 30
kubectl create -f 6echoservice.yml
