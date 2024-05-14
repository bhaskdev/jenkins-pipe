from openjdk
copy target/*.jar /
Expose 8080
Entrypoint ["java","-jar","/java-bh-snapshot.jar"]
