# Start with a base image containing Java runtime
FROM openjdk:17-oracle

# Add Maintainer Info
LABEL maintainer="your.email@example.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 7777

# The application's jar file
ARG JAR_FILE=target/spring-boot-app.jar

# Add the application's jar to the container
ADD ${JAR_FILE} app.jar

# Run the jar file
ENTRYPOINT ["java","-jar","/app.jar"]