# Étape 1 : compilation et génération du JAR
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Copier les fichiers du projet
COPY pom.xml .
COPY src ./src

# Compiler et générer le JAR
RUN mvn clean package -DskipTests

# Étape 2 : exécution de l'application
FROM eclipse-temurin:17-jre

WORKDIR /app

LABEL maintainer="your.email@example.com"

# Port utilisé par l'application Spring Boot
EXPOSE 7777

# Copier le JAR généré à l'étape précédente
COPY --from=build /app/target/*.jar /app/app.jar

# Démarrer l'application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
