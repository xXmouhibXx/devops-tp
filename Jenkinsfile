pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "yourusername/hello-devops"
        DOCKER_TAG = "${env.BUILD_ID}"
    }
    stages {
        stage('Build Docker') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
            }
        }
        stage('Push Docker') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}'
                    sh 'docker push ${DOCKER_IMAGE}:${DOCKER_TAG}'
                }
            }
        }
        stage('Smoke Test') {
            steps {
                sh '''
                    docker run -d -p 5000:5000 --name smoke-test ${DOCKER_IMAGE}:${DOCKER_TAG}
                    sleep 10  # Wait for app to start
                    curl -f http://localhost:5000 && echo "App is up!"
                    docker stop smoke-test
                    docker rm smoke-test
                '''
            }
        }
    }
}
