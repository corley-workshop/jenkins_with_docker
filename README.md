# Jenkins with Docker (Ubuntu Host with Docker)

## Build image

We need to pass the docker group id from the host to the container when building:

`docker build --build-arg docker_group_id=$(cat /etc/group | grep docker | cut -d: -f3) -t jenkins_with_docker .`

## Launch

Just a simple:

`docker-compose up -d`
