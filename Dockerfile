FROM debian:stable

ARG MINECRAFT_VERSION

ENV MINECRAFT_SERVER_URL "https://mc-utils.vercel.app/api/server-jars/fabric/${MINECRAFT_VERSION}/download"

RUN apt update; \
    apt install -y default-jre ca-certificates-java curl; \
    curl -fL ${MINECRAFT_SERVER_URL} -o minecraft_server_${MINECRAFT_VERSION}.jar;

WORKDIR /data
VOLUME /data

EXPOSE 25565

#Automatically accept Minecraft EULA, and start Minecraft server
CMD echo eula=true > /data/eula.txt && java -jar /minecraft_server_${MINECRAFT_VERSION}.jar
