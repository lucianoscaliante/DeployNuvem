#!/bin/bash
echo "Criando as imagens Docker........!!!!!"

docker build -t lucianoscaliante/projeto-backend:1.0 backend/.
docker build -t lucianoscaliante/projeto-database:1.0 database/.

echo "Fazendo push das imagens docker....!!!!!!"

docker push lucianoscaliante/projeto-backend:1.0
docker push lucianoscaliante/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes.......!!!!"

kubectl apply -f ./services.yml

echo "Criando os deployments......!!!!!"

kubectl apply -f ./deployment.yml