pipeline {
  agent any
  environment {
    DOCKER_IMAGE = 'my-image'
  }
  stages {
    stage('Checkout') {
      steps {
        // Checkout your Git repository
        git branch: 'main', url: 'https://github.com/GeraldAkenji/microservices.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          // Build Docker image
          docker.build("${DOCKER_IMAGE}", "-f Dockerfile .")
        }
      }
    }
    stage('Run Docker Container') {
      steps {
        script {
          // Run Docker container
          sh "docker run -d --name ${DOCKER_IMAGE}_cont -p 7237:8080 ${DOCKER_IMAGE}"
        }
      }
      post {
        always {
          // Clean up: stop and remove Docker container
          script {
            sh "docker stop ${DOCKER_IMAGE}_cont"
            sh "docker rm ${DOCKER_IMAGE}_cont"
          }
        }
      }
    }
  }
  // Define post-build actions if necessary
  post {
    success {
      echo 'Pipeline succeeded!'
    }
    failure {
      echo 'Pipeline failed :('
    }
  }
}