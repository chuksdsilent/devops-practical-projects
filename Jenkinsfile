pipeline{
    agent any
    tools {
        maven 'maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/chuksdsilent/devops-practical-projects.git']])
                sh 'mvn clean install -Dskps'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh 'docker build -t oshabz/devops-integration:1.0 .'
                }
            }
        }
        stage('Push image to docker hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockercred', variable: 'dockercred')]) {
                       sh 'docker login -u oshabz -p ${dockercred}'
                       sh 'docker push oshabz/devops-integration:1.0'
                    }
                }
            }
        }
    }
}
