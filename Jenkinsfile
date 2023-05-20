pipeline {
    agent any

    stages {
        stage('Simple Task') {
            steps {
                echo 'This is a simple task'
            }
        }

        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/your-repo.git'
            }
        }
    }
}
