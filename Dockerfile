FROM maven:3.9.11-amazoncorretto-21-debian AS builder

WORKDIR /usr/src/guest-book
COPY pom.xml .
RUN mvn -B dependency:go-offline    

COPY . .
RUN mvn package -DskipTests

FROM amazoncorretto:21.0.8

WORKDIR /guest-book
COPY --from=builder /usr/src/guest-book/target/gbook-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java", "-jar", "/guest-book/gbook-0.0.1-SNAPSHOT.jar"]