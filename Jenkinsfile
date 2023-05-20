pipeline {
    agent any
    tools {
        nodejs 'nodejs'
    }
    parameters {
        choice(name:'VERSION', choices:['1.0', '1.1', '1.2'], description:'deployment pipeline')
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
        stage('Build - Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                }
            }
        }
        stage('Test - Backend') {
            steps {
                dir('backend') {
                    // sh 'npm run test'
                    echo "Backend the Tests"
                }
            }
        }
        stage('Test - Frontend') {
            steps {
                dir('frontend') {
                    // sh 'npm run test'
                    echo "Frontend the Tests"
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
        // stage('Build Image - Frontend') {
        //     steps {
        //         dir('frontend') {
        //             withCredentials([usernamePassword(credentialsId: '491e94cc-85e3-49b0-a658-8202e78e33b7', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        //                 sh 'docker build -t codedfingers/sabaoth-frontend .'
        //                 sh "echo $PASS | docker login -u $USER --password-stdin"
        //                 sh 'docker push jennykibiri/sample-frontend'
        //             }
        //         }
        //     }
        // }
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
        //             def dockerCmd = 'docker run -p 80:80 -d codedfingers/sabaoth-frontend:latest'
        //             sshagent(['0f5914ae-046f-4fb1-a2bb-4f719659ba1d']) {
        //                 sh "ssh -o StrictHostKeyChecking=no ubuntu@3.88.152.217 ${dockerCmd}"
        //             }
        //         }
        //     }
        // }
    }
}
