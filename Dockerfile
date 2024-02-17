FROM python:3.8-slim
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    gcc \
    libevent-dev \
    libpq-dev
RUN pip install --upgrade pip && \
    pip cache purge && \
    pip install mlflow[extras]==1.19.0 && \
    pip install psycopg2-binary==2.8.5 && \
    pip install boto3==1.15.16
EXPOSE 5000
ENTRYPOINT ["mlflow", "server"]