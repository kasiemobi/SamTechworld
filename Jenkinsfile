pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kasiemobi/SamTechworld.git']])
            }
        }
        
        stage('Build') {
            steps {
                // Set up JDK (if necessary) - Adjust the JDK name according to your Jenkins configuration
                // tools {
                //   jdk 'JDK8'
                // }

                // Build the Java project using Maven
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
            steps {
                // Build Docker image using the Dockerfile
                sh 'docker build -t my-image-name -f Home/Downloads/Docker .'
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
