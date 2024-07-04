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
          docker.image("${DOCKER_IMAGE}").run('-p 8080:8080')
        }
      }

      post {
        always {
          // Clean up: stop and remove Docker container
          script {
            docker.container("${DOCKER_IMAGE}").stop()
            docker.container("${DOCKER_IMAGE}").remove(force: true)
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