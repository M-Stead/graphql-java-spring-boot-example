FROM gradle:5.5.1-jdk8 as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE=/home/gradle/src/build/libs/gs-spring-books-graphql-0.0.1-SNAPSHOT.jar
COPY --from=builder ${JAR_FILE} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]