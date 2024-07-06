FROM owasp/dependency-check:latest

### Pull latest NVD data
RUN /usr/share/dependency-check/bin/dependency-check.sh --enableExperimental --updateonly 

VOLUME ["/src", "/report"]
WORKDIR /src
