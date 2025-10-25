FROM eclipse-temurin:21-jdk-alpine AS builder
WORKDIR /app

RUN apk add --no-cache maven

COPY pom.xml ./

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -DskipTests -B

FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/target/fitcrm-user-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]