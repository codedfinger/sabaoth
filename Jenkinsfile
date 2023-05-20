pipeline {
   agent any

    stages {
        stage('Simple Task') {
            steps {
                echo 'This is a simple task'
            }
        }

        stage('Test - Backend') {
            steps {
                dir('backend') {
                    // sh 'npm run test'
                    echo "Backend Tests"
                }
            }
        }
    }
}
