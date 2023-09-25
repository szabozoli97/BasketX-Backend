FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /opt/backend
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src ./src
RUN ./mvnw clean install

FROM eclipse-temurin:17-jre-jammy
WORKDIR /opt/backend
EXPOSE 8080
COPY --from=builder /opt/backend/target/*.jar /opt/backend/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar" ]