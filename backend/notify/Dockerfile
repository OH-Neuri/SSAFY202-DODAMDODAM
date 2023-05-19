# FROM azul/zulu-openjdk:11
FROM openjdk:11-jdk-slim
WORKDIR /spring
COPY ./build/libs/notify-0.0.1-SNAPSHOT.jar server.jar
ENTRYPOINT ["java", "-jar", "server.jar"]