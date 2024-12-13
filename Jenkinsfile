pipeline {
    agent {
        kubernetes {
            yamlFile 'jenkins-pod-agent.yaml'
        }
    }
    environment {
        DOCKER_REPOSITORY = 'europe-west1-docker.pkg.dev/assignment-444117/docker-development-repository'
        DOCKER_IMAGE = 'spring-boot-react-example'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                container('kaniko') {
                    sh """
                    #!/bin/bash
                    set -e
                    /kaniko/executor \
                        --dockerfile="${WORKSPACE}/Dockerfile" \
                        --context="${WORKSPACE}/" \
                        --destination="${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${BUILD_NUMBER}" \
                        --verbosity=debug
                    """
                }
            }
        }
    }
    post {
        success {
            echo "Docker image pushed successfully: ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
        }
        failure {
            echo "Pipeline failed. Please check the logs."
        }
    }
}
