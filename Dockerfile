# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Copy the JAR file built by Maven
COPY target/myapp-1.0-SNAPSHOT.jar /app/myapp.jar

# Set working directory
WORKDIR /app

# Expose the port your app listens on
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "myapp.jar"]
