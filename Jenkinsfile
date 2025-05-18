pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18'     // Додай через Jenkins: Manage Jenkins → Global Tool Configuration
        gradle 'Gradle 7.6'    // Додай так само
    }

    stages {
        stage('📥 Checkout code') {
            steps {
                git url: 'https://github.com/your-username/internship_project.git', branch: 'main'
            }
        }

        stage('📦 Check frontend dependencies') {
            steps {
                dir('frontend') {
                    sh 'npm ci || npm install'
                }
            }
        }

        stage('📦 Check backend dependencies') {
            steps {
                dir('backend') {
                    sh './gradlew dependencies'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Усі залежності встановлені успішно!'
        }
        failure {
            echo '❌ Помилка при встановленні залежностей.'
        }
    }
}
