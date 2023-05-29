# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the project's pom.xml file to the working directory
COPY pom.xml .

# Resolve the project dependencies (downloading dependencies only)
RUN mvn dependency:go-offline -B

# Copy the entire project source code to the working directory
COPY src ./src

# Build the application
RUN mvn package

# Create a new Docker image with the built JAR file
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the built JAR file from the previous build stage to the current stage
COPY --from=build /app/target/my-project-1.0-SNAPSHOT.jar .

# Specify the command to run when the container starts
CMD ["java", "-jar", "my-project-1.0-SNAPSHOT.jar"]
