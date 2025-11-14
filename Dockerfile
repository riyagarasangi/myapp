# Use a supported OpenJDK 17 image
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy jar from Maven build
COPY target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
