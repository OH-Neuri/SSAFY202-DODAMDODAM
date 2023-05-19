FROM azul/zulu-openjdk:11
WORKDIR /spring
COPY ./build/libs/chatapp-0.0.1-SNAPSHOT.jar server.jar
ENTRYPOINT ["java", "-jar", "server.jar"]