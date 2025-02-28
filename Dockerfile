FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    openssh-client \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install ansible

COPY . /ansible
WORKDIR /ansible

CMD ["ansible-playbook", "--version"]