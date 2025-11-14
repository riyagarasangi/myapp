pipeline {
    agent any
    tools {
        maven 'Maven-3.9.11'
    }
    environment {
        DOCKER_HUB_REPO = 'riyagarasangi/myapp'  // Docker Hub repository
        DOCKER_IMAGE_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/riyagarasangi/myapp.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Compiling the project...'
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging the project into a JAR...'
                bat 'mvn package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "\"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe\" build -t %DOCKER_HUB_REPO%:%DOCKER_IMAGE_TAG% ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', 
                                                  usernameVariable: 'DOCKER_USER', 
                                                  passwordVariable: 'DOCKER_PASS')]) {
                    // Login using Personal Access Token
                    bat "\"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe\" login -u %DOCKER_USER% -p %DOCKER_PASS%"
                    // Push the image
                    bat "\"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe\" push %DOCKER_HUB_REPO%:%DOCKER_IMAGE_TAG%"
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build, Package, and Docker Push Successful!'
        }
        failure {
            echo '❌ Pipeline failed! Check the logs above.'
        }
    }
}
