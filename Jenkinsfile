pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/riyagarasangi/myapp.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Build stage - code pulled successfully!'
            }
        }
    }
}
