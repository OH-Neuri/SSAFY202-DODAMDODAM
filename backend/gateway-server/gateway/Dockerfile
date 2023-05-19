FROM azul/zulu-openjdk:11
WORKDIR /gateway
COPY ./build/libs/gateway-0.0.1-SNAPSHOT.jar gateway-server.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "gateway-server.jar"]