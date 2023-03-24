FROM openjdk:11
EXPOSE 8080
ADD target/docker-jenkins-intergration-sample.jar docker-jenkins-intergration-sample.jar
ENTRYPOINT ["java","-jar","/docker-jenkins-intergration-sample.jar"]
