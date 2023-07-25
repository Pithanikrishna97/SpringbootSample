# Use an OpenJDK runtime as the base image
FROM openjdk:11-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at /app
COPY /home/runner/.m2/repository/com/myapp/myapp_server/0.0.1-SNAPSHOT/myapp_server-0.0.1-SNAPSHOT.jar /app/myapp_server-0.0.1-SNAPSHOT.jar

# Expose the port that the application listens on
EXPOSE 8080

# Set the command to run the application when the container starts
CMD ["java", "-jar", "myapp_server-0.0.1-SNAPSHOT.jar"]

