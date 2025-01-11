# Use the Eclipse Temurin base image
FROM eclipse-temurin:17-jdk-alpine

# Expose the application port
EXPOSE 8080

# Set the application home environment variable
ENV APP_HOME /usr/src/app

# Create a new user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy the application JAR file into the container
COPY target/*.jar $APP_HOME/app.jar

# Change ownership of the application directory
RUN chown -R appuser:appgroup $APP_HOME

# Set the working directory
WORKDIR $APP_HOME

# Switch to the new user
USER appuser

# Run the application
CMD ["java", "-jar", "app.jar"]
