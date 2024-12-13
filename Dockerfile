FROM maven:3.9.2 AS builder

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN mvn clean package

FROM openjdk:8-jre AS runtime

WORKDIR /app

COPY --from=builder /usr/src/app/target/*.jar spring-boot-react-example.jar

EXPOSE 8080

CMD ["java", "-jar", "spring-boot-react-example.jar"]
