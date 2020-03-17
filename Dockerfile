FROM jenkins/jenkins:lts

USER root

ARG docker_group_id=1000
ENV DOCKER_GROUP_ID=$docker_group_id

RUN apt-get update && \
    apt-get -y install apt-utils curl jq && \
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    groupadd -g $DOCKER_GROUP_ID dockerhost && \
    usermod -aG dockerhost jenkins

USER jenkins
