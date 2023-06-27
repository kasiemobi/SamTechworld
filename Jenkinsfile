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
        
        stage('Build Image') {
            steps {
                sh 'docker build -t Java-image:latest .'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                sh 'docker tag my-image:latest samuel8814/Java-image:latest'
                sh 'docker push samuel8814/Java-image:latest'
            }
        }
        
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
