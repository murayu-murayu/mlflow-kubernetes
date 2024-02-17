# MLflow on Minikube

MLflow を Minikube 上で実行するサンプル

## 実行環境

DockerDesktop, RancherDesktop 等により、ローカル上で実行します。

## 実行手順

1. Minikube クラスタ起動

   ```
   minikube start
   ```

2. MLflow サーバー用の Docker イメージビルド

   ```
   docker build --tag [DockerHubアカウント名]/mlflow-server .
   ```

3. Docker Hub へプッシュ

   ```
   docker push [DockerHubアカウント名]/mlflow-server
   ```

4. DB (PostgreSQL)のデプロイ

   ```
   kubectl apply -f k8s/mlflow_postgres.yaml
   ```

5. ストレージ(MinIO)のデプロイ

   ```
   kubectl apply -f k8s/mlflow_minio.yaml
   ```

6. MLflow サーバーのデプロイ

   ```
   kubectl apply -f k8s/mlflow_deployment.yaml
   ```

7. ポッド名の確認

   ```
   kubectl get pods
   ```

8. MLflow サーバーへのアクセスをローカルから行うために Port Forwarding を設定

   ```
   kubectl port-forward [MLflowサーバーのポッド名] 5000:5000
   ```

9. MinIO へのアクセスもローカルから行うためには、同様に Port Forwarding を設定

   ```
   kubectl port-forward [MinIOのポッド名] 9000:9000
   ```

## 参考リポジトリ

[Deploying MLflow on Minikube, Openshift 4, and Azure Kubernetes Service](https://github.com/pdemeulenaer/mlflow-on-kubernetes)
