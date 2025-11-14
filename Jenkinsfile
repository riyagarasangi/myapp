pipeline {
    agent any
    tools {
        maven 'Maven-3.9.11'
    }
    environment {
        DOCKER_HUB_REPO = 'riyagarasangi/myapp'  // your Docker Hub repo
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/riyagarasangi/myapp.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }
        stage('Package') {
            steps {
                bat 'mvn package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %DOCKER_HUB_REPO%:latest ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS%'
                    bat "docker push %DOCKER_HUB_REPO%:latest"
                }
            }
        }
    }
    post {
        success { echo '✅ Build, Package, and Docker Push Successful!' }
        failure { echo '❌ Pipeline failed!' }
    }
}
