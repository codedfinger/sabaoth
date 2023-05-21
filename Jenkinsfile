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
        // stage('Build - Backend') {
        //     steps {
        //         dir('backend') {
        //             sh 'npm install'
        //         }
        //     }
        // }
        stage('Test - Backend') {
            steps {
                dir('backend') {
                    // sh 'npm run test'
                    echo "Backend Tests"
                }
            }
        }
        stage('Test - Frontend') {
            steps {
                dir('frontend') {
                    // sh 'npm run test'
                    echo "Frontend Tests"
                }
            }
        }
        // stage('Build Image - Backend') {
        //     steps {
        //         dir('backend') {
        //             withCredentials([usernamePassword(credentialsId: '491e94cc-85e3-49b0-a658-8202e78e33b7', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        //                 sh 'docker build -t jennykibiri/sample-backend .'
        //                 sh "echo $PASS | docker login -u $USER --password-stdin"
        //                 sh 'docker push jennykibiri/sample-backend'
        //             }
        //         }
        //     }
        // }
        stage('Build Image - Frontend') {
            steps {
                dir('frontend') {
                    script  {
                        sshagent(['skey']) {
                            sh "ssh -o StrictHostKeyChecking=no ubuntu@54.89.212.148 'sudo chown -R www-data:www-data /var/www/html'"
                            sh "ssh -o StrictHostKeyChecking=no ubuntu@54.89.212.148 'sudo chmod -R 755 /var/www/html'"
                            sh "scp -r * ubuntu@54.89.212.148:/var/www/html"
                            sh "ssh ubuntu@54.89.212.148 'cd /var/www/html && npm install && npm run dev'"
                        }
                    }
                }
            }
        }
        // stage('Deploy - Backend') {
        //     steps {
        //         script {
        //             def dockerCmd = 'docker run -p 3000:3000 -d codedfingers/sabaoth-backend:latest'
        //             sshagent(['0f5914ae-046f-4fb1-a2bb-4f719659ba1d']) {
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@52.23.164.165 ${dockerCmd}"
        //             }
        //         }
        //     }
        // }
        // stage('Deploy - Frontend') {
        //     steps {
        //         script {                    
        //             // Copy the files to the remote server
        //              sshagent(['skey']) {
        //                 sh "ssh ubuntu@3.88.152.217 'cd frontend && sudo cp -r * /var/www/html'"
        //                 // sh "scp -r * ubuntu@3.88.152.217:/var/www/html"
        //             }
                    
        //             // Set appropriate permissions on the remote server
        //             sshagent(['skey']) {
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@54.89.212.148 'sudo chown -R www-data:www-data /var/www/html'"
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@54.89.212.148 'sudo chmod -R 755 /var/www/html'"
        //             }
                    
        //             // Restart Apache on the remote server
        //             sshagent(['skey']) {
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@54.89.212.148 'sudo service apache2 restart'"
        //             }
        //         }
        //     }
        // }
    }
}
