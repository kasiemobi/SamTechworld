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
        
 stage('Build Docker image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build('my-image-name')
                }
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
