FROM docker_registy/ansible/base:2.4.2.0
LABEL maintainer="Milind Dhoke <mdhoke@noname.com>"

RUN mkdir -p /etc/ansible/ 

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks
COPY . /ansible/playbooks/
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_RETRY_FILES_ENABLED false

ENTRYPOINT ["/usr/bin/ansible-playbook","/ansible/playbooks/bootstrapper.yaml"]
   
