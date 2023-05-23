# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project's pom.xml file
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the project source code
COPY src ./src

# Build the project
RUN mvn package

# Use a lightweight base image with Java only
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/my-project.jar .

# Specify the command to run the application
CMD ["java", "-jar", "my-project.jar"]
