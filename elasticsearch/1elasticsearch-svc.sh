kubectl cluster-info
kubectl get nodes
minikube addons list
minikube addons enable dashboard
minikube addons open dashboard
kubectl run elasticsearch --image=docker.elastic.co/elasticsearch/elasticsearch:6.2.1 --env="discovery.type=single-node" --port=9200
kubectl get deployments
export POD_NAME=$(kubectl get pods -o go-template --template '\n')
#echo Name of the Pod: $POD_NAME
#kubectl logs $POD_NAME

#Need be other session
#nohup kubectl proxy &

curl http://localhost:8001

kubectl expose deployment elasticsearch --type=LoadBalancer
minikube service elasticsearch

