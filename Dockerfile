# Container image that runs your code
FROM asciidoctor/docker-asciidoctor:latest

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add --update openssh-client git-lfs
RUN gem install --no-document --prerelease asciidoctor-tabs

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
