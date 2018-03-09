FROM alpine:3.6
LABEL maintainer="Milind Dhoke <mdhoke@qualys.com>"

RUN apk --update add python py-pip ca-certificates python-dev libffi-dev openssl-dev build-base  && \
    pip install 'ansible==2.4.2.0'     && \
    apk del build-base      && \
    rm -rf /var/cache/apk/*        
    
RUN mkdir -p /ansible/playbooks
WORKDIR /ansible/playbooks
COPY . /ansible/playbooks/
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False

ENTRYPOINT ["/usr/bin/ansible-playbook","/ansible/playbooks/qjenkins.yml"]
   
