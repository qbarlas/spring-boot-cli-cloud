FROM davidcaste/alpine-java-unlimited-jce

ARG SPRING_CLOUD_VERSION='2.2.1.RELEASE'

RUN apk add --no-cache bash curl zip unzip sed
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install springboot && spring install org.springframework.cloud:spring-cloud-cli:${SPRING_CLOUD_VERSION}"

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
