# Use an OpenJDK runtime as the base image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at /app
ADD target/*.jar /app/my-spring-boot-app.jar

# Expose the port that the application listens on
EXPOSE 8080

# Set the command to run the application when the container starts
CMD ["java", "-jar", "my-spring-boot-app.jar"]
