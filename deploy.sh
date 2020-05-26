docker build -t andy3ws/multi-client:latest -t andy3ws/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t andy3ws/multi-server:latest -t andy3ws/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t andy3ws/multi-worker:latest -t andy3ws/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push andy3ws/multi-client:latest
docker push andy3ws/multi-server:latest
docker push andy3ws/multi-worker:latest

docker push andy3ws/multi-client:$SHA
docker push andy3ws/multi-server:$SHA
docker push andy3ws/multi-worker:$SHA
kubectl apply -f ./k8s

kubectl set image deployments/server-deployment server=andy3ws/multi-server:$SHA
kubectl set image deployments/client-deployment client=andy3ws/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=andy3ws/multi-worker:$SHA