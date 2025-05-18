# backend/Dockerfile
FROM openjdk:11-jre-slim

ENV APP_HOME=/app
WORKDIR $APP_HOME

COPY build/libs/*.war app.war
COPY build/server/webapp-runner*.jar webapp-runner.jar

EXPOSE 8080

CMD ["java", "-jar", "webapp-runner.jar", "app.war"]
