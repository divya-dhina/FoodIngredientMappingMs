# Stage 1: Build with Maven + JDK 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Run on slim JDK 21
FROM openjdk:21-jdk-slim
WORKDIR /app

# Copy the jar file from build stage
COPY --from=build /build/target/foodingredientmapping-ms-0.0.1-SNAPSHOT.jar app.jar

# Optional: Copy an existing SQLite DB if needed
# COPY foodingredientmapping-ms.db ./foodingredientmapping-ms.db

EXPOSE 8094

ENTRYPOINT ["java", "-jar", "app.jar"]
