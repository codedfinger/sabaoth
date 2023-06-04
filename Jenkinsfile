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
            sh "docker build --no-cache -t codedfingers/sabaoth-frontend:latest ."
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

    stage('Deploy Frontend') {
      steps {
        // Stop and remove any existing containers
        sh "docker stop sabaoth-frontend-container || true"
        sh "docker rm sabaoth-frontend-container || true"

        script {
          // Install and run the app on the server
            sshagent(['skey']) {                        
              sh "ssh -o StrictHostKeyChecking=no ubuntu@ip_addr_server 'sudo npm install && sudo pm2 start npm --name \"saba\" -- start'"
            }
          }
      }
    }
  }
}
