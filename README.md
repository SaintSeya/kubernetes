# kubernetes

To run the application:

1 - Create a Virtual machine that allows Nested Virtualization. For example in AZURE:

Standard D4 v3 (4 vcpus, 16 GB memory)

Linux DISTRIB_DESCRIPTION="Ubuntu 18.04.1 LTS"

2 - Make a repo clone:

git@github.com:SaintSeya/kubernetes.git

3 - run the the shell script:

sh 0install_solution.sh

4 - to check if app is currently running:

kubectl get pods

curl http://192.168.99.100:31002/all/create

curl http://192.168.99.100:31002/all/
