# Use official OpenJDK image as a base
FROM openjdk:17-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy the jar built by Maven into the container
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
