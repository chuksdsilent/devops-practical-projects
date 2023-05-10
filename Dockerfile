FROM openjdk:8
EXPOSE 8080
ADD target/docker-jenkins-integration-sample.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]
