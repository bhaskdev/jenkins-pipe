FROM openjdk
COPY target/*.jar /
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/java-bh-snapshot.jar"]
