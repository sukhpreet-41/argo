pipeline{

    agent any
    enviornment{
        DOCKERHUB_USERNAME = "sukhpreet2002"
        APP_NAME = "argoCD_project"
        IMAGE_TAG = "$(BUILD_NUMBER)"
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
                    git credentialsId: 'github'
                    url: 'https://github.com/sukhpreet-41/argo.git'
                    branch: 'main'
                }
            }
        }
    }
}