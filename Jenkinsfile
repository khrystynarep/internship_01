pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18'     // Додай через Jenkins: Manage Jenkins → Global Tool Configuration
        gradle 'Gradle 7.6'    // Додай так само
    }

    stages {
        stage('📥 Checkout code') {
            steps {
                git url: 'https://github.com/khrystynarep/internship_01.git', branch: '03'
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
               
                    sh './gradlew :backend:build -x test' // dependencies'
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
