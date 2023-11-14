pipeline {
    agent any
    tools {
        nodejs 'Nodejs'
    }
    parameters {
        choice(name: 'VERSION', choices: ['1.0', '1.1', '1.2'], description: 'Choose the version of the project')
        booleanParam(name: 'executeTests', description: 'Execute the tests', defaultValue: false)
    }
    environment {
        DOCKER_REGISTRY_URL = "docker.io/codedfingers"
        DOCKER_REGISTRY_CREDENTIALS = credentials('docker-login')
        REMOTE_SERVER_IP = "54.226.250.4"
        VERSION = "1.0"
        SSH_CREDENTIALS = credentials('ssh-key')

    }
    stages {

        stage('Build and Push Docker Image - Frontend') {
            steps {
                script {
                    dir('hapi-frontend') {
                        // Build Docker image
                        sh "docker build -t $DOCKER_REGISTRY_URL/saba-frontend:$VERSION ."
                        
                        // Push Docker image to registry
                        withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
                            sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL"
                            sh "docker push $DOCKER_REGISTRY_URL/saba-frontend:$VERSION"
                        }
                    }
                }
            }
        }

        // stage('Build and Push Docker Image - Backend') {
        //     steps {
        //         script {
        //             dir('backend') {
        //                 // Build Docker image
        //                 sh "docker build -t $DOCKER_REGISTRY_URL/saba-backend:$VERSION ."
                        
        //                 // Push Docker image to registry
        //                 withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "$DOCKER_REGISTRY_CREDENTIALS", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD']]) {
        //                     sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL"
        //                     sh "docker push $DOCKER_REGISTRY_URL/saba-backend:$VERSION"
        //                 }
        //             }
        //         }
        //     }
        // }

        // stage('Test - Backend') {
        //     steps {
        //         dir('backend') {
        //             sh 'npm run test'
        //         }
        //     }
        // }

        stage('Test - Frontend') {
            steps {
                dir('hapi-frontend') {
                    sh 'npm install'
                    sh 'npm test'
                }
            }
        }

        stage('Deploy - Frontend') {
            steps {
                script {
                    // Pull Docker image from registry
                    withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USER')]) {
                        sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL"
                        sh "docker pull $DOCKER_REGISTRY_URL/saba-frontend:$VERSION"
                    }

                    // Copy Docker Compose file to the server
                    sshagent(credentials: ['ssh-key']) {
                        sh "scp -o StrictHostKeyChecking=no docker-compose-frontend.yml ubuntu@$REMOTE_SERVER_IP:/home/ubuntu/"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@$REMOTE_SERVER_IP 'cd /home/ubuntu/ && docker-compose -f docker-compose-frontend.yml up -d'"

                    }

                    // SSH into the server and run Docker Compose
                    // sshagent(credentials: [SSH_CREDENTIALS]) {
                    // }
                }
            }
        }

        // stage('Deploy - Backend') {
        //     steps {
        //         script {
        //             // Pull Docker image from registry
        //             withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: "$DOCKER_REGISTRY_CREDENTIALS", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD']]) {
        //                 sh "docker login -u $DOCKER_USER -p $DOCKER_PASSWORD $DOCKER_REGISTRY_URL"
        //                 sh "docker pull $DOCKER_REGISTRY_URL/saba-backend:$VERSION"
        //             }

        //             // Copy Docker Compose file to the server
        //             sshagent(['skey']) {
        //                 sh "scp -o StrictHostKeyChecking=no docker-compose-backend.yml ubuntu@$REMOTE_SERVER_IP:/home/ubuntu/"
        //             }

        //             // SSH into the server and run Docker Compose
        //             sshagent(['skey']) {
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@$REMOTE_SERVER_IP 'cd /home/ubuntu/ && docker-compose -f docker-compose-backend.yml up -d'"
        //             }
        //         }
        //     }
        // }
    }
}
