FROM alpine:3.6
LABEL maintainer="Milind Dhoke <mdhoke@qualys.com>"

RUN apk --update add python py-pip ca-certificates python-dev libffi-dev openssl-dev build-base  && \
    pip install ansible     && \
    apk del build-base      && \
    rm -rf /var/cache/apk/*        
    
RUN mkdir -p /etc/ansible/ 

RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks
COPY . /ansible/playbooks/
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_RETRY_FILES_ENABLED false

ENTRYPOINT ["/usr/bin/ansible-playbook","/ansible/playbooks/jenkins.yml","-vv"]
   
