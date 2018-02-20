FROM azul/zulu-openjdk-alpine:8

MAINTAINER Lucas Rogerio Caetano Ferreira "luneo7@gmail.com"

# Install prerequisites
RUN apk add --no-cache\
        bash \
        curl \
        wget \
        tar \
        ca-certificates && \
        update-ca-certificates



ENV LIFERAY_HOME=/usr/local/liferay-ce-portal-7.0-ga4
ENV CATALINA_HOME=$LIFERAY_HOME/tomcat-8.0.32
ENV PATH=$CATALINA_HOME/bin:$PATH
ENV LIFERAY_USER liferay
ENV LIFERAY_UID 8080

RUN addgroup -S -g $LIFERAY_UID $LIFERAY_USER && \
    adduser -S -u $LIFERAY_UID -G $LIFERAY_USER -s /bin/bash $LIFERAY_USER

WORKDIR /usr/local



RUN mkdir -p "$LIFERAY_HOME" \
			&& set -x \
            && wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1k0Ldv-V9dNPEaDg1CI4RYJfdC_i8KYDj' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1k0Ldv-V9dNPEaDg1CI4RYJfdC_i8KYDj" -O liferay-ce-portal-tomcat-7.0-ga4.tar.gz && rm -rf /tmp/cookies.txt \
			&& tar -xvzf liferay-ce-portal-tomcat-7.0-ga4.tar.gz \
			&& rm liferay-ce-portal-tomcat-7.0-ga4.tar.gz \
      && chown -R liferay:liferay $LIFERAY_HOME

EXPOSE 8080/tcp
EXPOSE 11311/tcp

COPY ./configs/portal-ext.properties $LIFERAY_HOME/portal-ext.properties
COPY ./configs/com.liferay.portal.store.s3.configuration.S3StoreConfiguration.cfg $LIFERAY_HOME/osgi/configs

RUN chown -R liferay:liferay $LIFERAY_HOME

USER liferay

ENTRYPOINT ["catalina.sh", "run"]
