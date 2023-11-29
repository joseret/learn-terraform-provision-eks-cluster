FROM gcr.io/cloud-builders/gcloud

ENV TERRAFORM_VERSION=1.5.4
ENV GOVC_VERSION=v0.29.0
#ENV TERRAFORM_VERSION_SHA256SUM=6544eb55b3e916affeea0a46fe785329c36de1ba1bdb51ca5239d3567101876f

RUN apt-get update && \
  apt-get -y install curl unzip ca-certificates && \
  curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  > terraform_linux_amd64.zip && \
  #    echo "${TERRAFORM_VERSION_SHA256SUM} terraform_linux_amd64.zip" > terraform_SHA256SUMS && \
  #    sha256sum -c terraform_SHA256SUMS --status && \
  unzip terraform_linux_amd64.zip -d /builder/terraform && cp /builder/terraform/terraform /usr/local/bin && \
  rm -f terraform_linux_amd64.zip

RUN curl -L https://github.com/vmware/govmomi/releases/download/${GOVC_VERSION}/govc_Linux_x86_64.tar.gz | gunzip > /usr/local/bin/govc
RUN chmod +x /usr/local/bin/govc
RUN apt-get install jq -y && cp /usr/bin/jq /usr/local/bin

RUN apt update && apt -y install software-properties-common \
  && apt-add-repository --yes --update ppa:ansible/ansible \
  && apt -y install ansible

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
  python3 get-pip.py --user && \
  chmod +x /root/.local/bin/* 
RUN cp root/.local/bin/pip3* /usr/local/bin

RUN export PATH=/root/.local/bin:$PATH && \
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

RUN gcloud components update --quiet


RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT /bin/bash
CMD "bash"