# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project source code to the working directory
COPY . .

# Build the application
RUN mvn package

# Expose port 3080 (or the desired port)
EXPOSE 3080

# Specify the command to run when the container starts
CMD ["java", "-jar", "target/my-project-1.0-SNAPSHOT.jar"]
