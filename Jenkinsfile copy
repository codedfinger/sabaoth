pipeline {
    agent any
    tools {
        nodejs 'Nodejs'
    }
    parameters {
        choice(name:'VERSION', choices:['1.0', '1.1', '1.2'], description:'Choose the version of the project')
        booleanParam(name:'executeTests', description:'Execute the tests', defaultValue:false)
    }
    stages {

        stage('Build Image - Frontend') {
            steps {
                dir('frontend') {
                    script  {
                        sshagent(['skey']) {
                            sh "scp -o StrictHostKeyChecking=no -r * ubuntu@ip_addr_server:/home/ubuntu/"
                        }
                    }
                }
            }
        }

        stage('Build Image - Backend') {
            steps {
                dir('backend') {
                    script  {
                        sshagent(['skey']) {
                            sh "scp -o StrictHostKeyChecking=no -r * ubuntu@ip_addr_server:/home/ubuntu/"
                        }
                    }
                }
            }
        }

        stage('Test - Backend') {
            steps {
                dir('backend') {
                    sh 'npm run test'
                }
            }
        }
        stage('Test - Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm run test'
                }
            }
        }

        stage('Deploy - Frontend') {
            steps {
                script {                    
                    // Install and run the app on the server
                     sshagent(['skey']) {                        
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@ip_addr_server 'sudo npm install && sudo pm2 start npm --name \"saba\" -- start'"
                    }
                    
                    // Restart Nginx on the remote server
                    sshagent(['skey']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@ip_addr_server 'sudo service nginx restart && sudo pm2 restart \"saba\"'"
                    }
                }
            }
        }

        stage('Deploy - Backend') {
            steps {
                script {                    
                    // Install and run the app on the server
                     sshagent(['skey']) {                        
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@ip_addr_server 'sudo npm install && sudo pm2 start npm --name \"saba\" -- start'"
                    }
                    
                    // Restart Nginx on the remote server
                    sshagent(['skey']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@ip_addr_server 'sudo service nginx restart && sudo pm2 restart \"saba\"'"
                    }
                }
            }
        }
    }
}
