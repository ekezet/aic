FROM python:3.11-alpine3.17
WORKDIR /home/ansible
RUN apk add --no-cache --virtual .tmp-build-dep gcc libc-dev libffi-dev && \
    apk add --no-cache openssh-client ca-certificates bash curl nano nano-syntax git && \
    rm -rf /var/cache/apk/* && adduser -D -H -u 1000 -s /bin/bash ansible && chown -R ansible: /home/ansible && \
    echo 'include "/usr/share/nano/*.nanorc"' >> /etc/nanorc
USER ansible
ENV PATH="${PATH}:/home/ansible/.local/bin"
ARG AV
RUN pip3 install --user ansible==${AV} boto3 && \
    ansible-galaxy collection install amazon.aws azure.azcollection kubernetes.core community.docker && \
    rm -rf /home/ansible/.cache/*
USER root
RUN apk del .tmp-build-dep
USER ansible
ENTRYPOINT ["/bin/bash"]
