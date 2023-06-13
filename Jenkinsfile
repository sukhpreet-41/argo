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
                    // docker_image = "${APP_NAME}" + "/" + docker.build "${IMAGE_NAME}"
                    // sh "docker build . " + "-t" ${IMAGE_NAME} " + "-f " + "/argo/Dockerfile" 

                    sh "docker build . -t " + "${IMAGE_NAME}" + ":" + "${BUILD_NUMBER}" + " -f /var/lib/jenkins/workspace/argoci/argo/Dockerfile"
                    sh "docker build . -t " + "${IMAGE_NAME}" + ":" + "latest" + " -f /var/lib/jenkins/workspace/argoci/argo/Dockerfile"

                }
            }
        }
        stage('Push docker image') {

            steps{
                script{

                    docker.withRegistry('',REGISTRY_CREDS){

                        sh 'docker push ' + "${IMAGE_NAME}" + ":" + "${BUILD_NUMBER}"
                        sh 'docker push ' + "${IMAGE_NAME}" + ":" + 'latest'

                    }

                }
            }
        }
        
        stage('Delete docker images') {

            steps{
                script{
                    sh "docker rmi ${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker rmi ${IMAGE_NAME}:latest"

                }
            }
        }
        

        stage('Updating k8s deployment file') {

            steps{
                script{
                    sh """

                    cat /var/lib/jenkins/workspace/argoci/argo/deploymet.yaml
                    sed -i "s|sukhpreet2002/argo:v1|sukhpreet2002/argo:${BUILD_NUMBER}|" /var/lib/jenkins/workspace/argoci/argo/deploymet.yaml
                    cat /var/lib/jenkins/workspace/argoci/argo/deploymet.yaml

                    """
                    
                }
            }
        }

        stage('push the changes of deployment to github'){
            steps{
                script{
                    sh """
                    cd /var/lib/jenkins/workspace/argoci/argo/
                    git init
                    git config --global user.name "jenkins commit"
                    git config --global user.email "jenkins@vscode.com"
                    git add deploymet.yaml
                    git commit -m "updated deployment file"

                    """
                    withCredentials([gitUsernamePassword(credentialsId: 'github', gitToolName: 'Default')]) {
                        sh "git push https://github.com/sukhpreet-41/argo.git main"
}

                }
            }
        }




    }
}

