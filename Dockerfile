# Base image
FROM openjdk:11-jdk

# Set the working directory
WORKDIR /app

# Copy the JAR file to the container
COPY target/myApp.java /app/myApp.java

# Expose the port your application is listening on (if applicable)
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "myApp.java"]
