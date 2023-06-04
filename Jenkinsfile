pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps {
        // Checkout the repository
        checkout scm
      }
    }

    stage('Build') {
      steps { 
        dir ("frontend") {
        // Load environment variables
        script {
            // Tag the Docker image
            sh "docker build -t codedfingers/sabaoth-frontend:latest ."
            }
        }     
      }
    }

    stage('Tag') {
      steps {
        dir ("frontend") {
            script {
            // Tag the Docker image
            sh "docker tag codedfingers/sabaoth-frontend:latest sabaoth-frontend:latest"
            }
        }
      }
    }

     stage('Push') {
      steps {
        dir ("frontend") {
            withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh "docker push codedfingers/sabaoth-frontend:latest"
        }
        }
      }
    }

    // stage('Run') {
    //   steps {
    //     // Stop and remove any existing containers
    //     sh "docker stop sbaoth-frontend-container || true"
    //     sh "docker rm sabaoth-frontend-container || true"

    //     // Run the Docker image as a container
    //     script {
    //       // Tag the Docker image
    //       sh "docker tag codedfingers/tare-backend:latest tare-backend:latest"
    //     }
    //   }
    // }
  }
}
