from openjdk
copy target/*.jar /
Expose 8080
Entrypoint ["java","-jar","/my-app-1.0-snapshot.jar"]
