pipeline {
    options {
        skipDefaultCheckout()
        buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10'))
        // ...
    }
    agent any
    
    stages {
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    script {
                        def dockerLoginCmd = "docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "echo \$DOCKER_PASSWORD | ${dockerLoginCmd}"
                    }
                }
            }
        }
        
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build and Push Image') {
            steps {
                script {
                    def imageName = "<sam8814/Techworld>"
                    def imageTag = "<latest>"
                    def dockerImage = "${imageName}:${imageTag}"
                    
                    sh "docker build -t ${dockerImage} ."
                    sh "docker push ${dockerImage}"
                }
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
