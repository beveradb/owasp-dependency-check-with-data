FROM owasp/dependency-check:latest

### Pull latest NVD data
RUN /usr/share/dependency-check/bin/dependency-check.sh --enableExperimental --updateonly 

### Insert Container Entry Point Script
COPY container-entrypoint.sh /usr/share/dependency-check/bin/container-entrypoint.sh

VOLUME ["/src", "/report"]
WORKDIR /src

CMD [ "/usr/share/dependency-check/bin/dependency-check.sh" ]
ENTRYPOINT [ "/usr/share/dependency-check/bin/container-entrypoint.sh" ]
