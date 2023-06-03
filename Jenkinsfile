pipeline {
    options {
        skipDefaultCheckout()
        // Enable launch diagnostics
        buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '10'))
        // ...
    }
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                // Build the Java application
                sh 'mvn clean install'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests
                sh 'mvn test'
            }
        }
        
        stage('Build Docker Image') {
            agent {
                docker {
                    // Specify the Docker image to use for the build
                    image 'docker:latest'
                    // Mount the Docker socket to access the Docker daemon
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                // Build the Docker image
                sh 'docker build -t my-image-name -f Dockerfile .'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the application
                echo 'Deploying application'
            }
        }
    }
}
