pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Prepare WAR for Docker') {
            steps {
                sh 'cp target/*.war mavendemo.war'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t mavendemo-image .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f mavendemo-container || true
                docker run -d -p 9090:8080 --name mavendemo-container mavendemo-image
                '''
            }
        }
    }
}
