pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    archiveArtifacts artifacts: 'build/*.war', fingerprint: true
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
    }
}
