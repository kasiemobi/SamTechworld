# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project source code to the working directory
COPY . .

# Build the application
RUN mvn package

# Create a new Docker image with the compiled Java classes
FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled Java classes from the previous build stage to the current stage
COPY --from=build /app/target/classes .

# Expose port 3080
EXPOSE 3080

# Specify the command to run when the container starts
CMD ["java", "App"]
