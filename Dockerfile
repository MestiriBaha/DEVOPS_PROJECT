
# Use the OpenJDK 11 image as the base image
FROM openjdk:8-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Install curl in the container
RUN apk update && apk add curl


# Define the Nexus URL where your artifact is hosted
ARG NEXUS_URL=http://192.168.56.1:8081/repository/DEVOPS_project

# Define the path to your artifact in Nexus
ARG ARTIFACT_PATH=tn/esprit/rh/achat/1.0/achat-1.0.jar

# Download the artifact from Nexus and copy it into the container
RUN curl -o app.jar $NEXUS_URL/$ARTIFACT_PATH

# Expose the port that your Spring Boot application runs on
EXPOSE 8082

# Define the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]

