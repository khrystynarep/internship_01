pipeline {
    agent any

    tools {
        nodejs 'NodeJS 18'      // додай через Jenkins → Global Tool Config
        gradle 'Gradle 7.6'     // додай через Jenkins → Global Tool Config
    }

    environment {
        CI = 'true'             // для React, щоб уникнути prompt
    }

    stages {
        stage('🧾 Checkout') {
            steps {
                git url: 'https://github.com/khrystynarep/internship_01.git', branch: 'main'
            }
        }

        stage('📦 Install Frontend Dependencies') {
            steps {
                dir('frontend') {
                    sh 'npm ci || npm install'
                }
            }
        }

        stage('🔧 Lint Frontend (React)') {
            steps {
                dir('frontend') {
                    sh 'npm run lint || echo "⚠️ Linting failed (will not block build)"'
                }
            }
        }

        stage('🛠️ Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm run build'
                }
            }
        }

        stage('📥 Build Backend (Gradle)') {
            steps {
                dir('backend') {
                    sh './gradlew clean build -x test'
                }
            }
        }

        stage('🔍 Checkstyle') {
            steps {
                dir('backend') {
                    sh './gradlew checkstyleMain checkstyleTest'
                }
            }
        }

        stage('🧪 Run Backend Tests') {
            steps {
                dir('backend') {
                    sh './gradlew test'
                }
            }
        }
    }

    post {
        success {
            echo '✅ Успішна збірка. Усі вимоги виконані.'
        }
        failure {
            echo '❌ Помилка: перевірки або збірка не пройшли.'
        }
        always {
            archiveArtifacts artifacts: '**/build/reports/**/*.*', allowEmptyArchive: true
            junit '**/build/test-results/test/*.xml'
        }
    }
}
