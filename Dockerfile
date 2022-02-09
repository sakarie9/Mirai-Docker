FROM adoptopenjdk/openjdk11:alpine-jre

ENV TZ Asia/Shanghai
ARG MCL_LINK=https://github.com/iTXTech/mirai-console-loader/releases/download/v1.2.2/mcl-1.2.2.zip
ARG MAH_LINK=https://github.com/project-mirai/mirai-api-http/releases/download/v2.4.0/mirai-api-http-v2.4.0.mirai.jar
WORKDIR /app

RUN apk --no-cache add wget &&\
    mkdir /app/plugins &&\
    wget ${MCL_LINK} -O /app/mcl.zip &&\
    wget -P /app/plugins ${MAH_LINK} &&\
    unzip mcl.zip &&\
    chmod +x mcl &&\
    ./mcl --dry-run

EXPOSE 8080

ENTRYPOINT exec ./mcl
