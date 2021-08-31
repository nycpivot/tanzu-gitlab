FROM ubuntu:latest

RUN apt-get update; apt-get install curl -y; apt-get install wget -y

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN wget https://tanzustorage.blob.core.windows.net/tanzu-build-service/kp-linux-0.3.1
RUN mv kp-linux-0.3.1 /usr/local/bin/kp
RUN chmod +x /usr/local/bin/kp

COPY ./create-kubeconfig.sh /usr/local/bin/create-kubeconfig.sh

CMD [ "/bin/bash" ]