pipeline {
    agent any
    stages{
        stage("checkout"){
            steps{
                git credentialsId: 'java', url: 'https://github.com/Raksham7/java.git'
            }
        }
        stage("unit testing"){
            steps{
                sh "mvn test"
            }
        }
        stage("Integration Testing"){
            steps{
                sh "mvn verify -DskipUnitTests"
            }
        }
        stage("Build"){
            steps{
                sh "mvn package"
            }
        }
        stage('ExecuteSonarQubeReport'){
            steps{
                sh  "mvn sonar:sonar"
            }
        }
        stage('DeployAppIntoTomcat'){
            steps{
                sshagent(['tomcat']){
                 sh "scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/java12/target/java-war-deploy-example-0.1-SNAPSHOT.jar ec2-user@54.205.116.125:/opt/apache-tomcat-9.0.71/webapps"    
                }
            }
        }   
    }
}
