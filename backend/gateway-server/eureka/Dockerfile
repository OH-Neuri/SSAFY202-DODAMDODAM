FROM azul/zulu-openjdk:11
WORKDIR /eureka
COPY ./build/libs/eureka-0.0.1-SNAPSHOT.jar eureka-server.jar
EXPOSE 9001
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]
