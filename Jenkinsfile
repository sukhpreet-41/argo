pipeline{

    agent any
    environment {
        DOCKERHUB_USERNAME = "sukhpreet2002"
        APP_NAME = "argo"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockerhub'
    }

    stages{
        stage('cleanup') {

            steps{
                script{
                    cleanWs()
                }
            }
        }

        stage('Checkout SCM') {

            steps{
                script{
                    // git credentialsId: 'github'
                    // url: 'https://github.com/sukhpreet-41/argo.git'
                    // branch: 'main'

                    sh "git clone https://github.com/sukhpreet-41/argo.git"
                    
                }
            }
        }
        stage('Build docker image') {

            steps{
                script{
                    // 
                    // docker_image = "${APP_NAME}" + "/" + docker.build "${IMAGE_NAME}"

                    // sh "docker build . " + "-t" ${IMAGE_NAME} " + "-f " + "/argo/Dockerfile" 

                    sh "docker build . -t sukhpreet2002/argo -f /argo/Dockerfile"
                }
            }
        }
    }
}