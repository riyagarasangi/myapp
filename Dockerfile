# Use official OpenJDK 17 image as a base
FROM openjdk:17-slim

# Set working directory inside container
WORKDIR /app

# Copy jar file from Maven build
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
