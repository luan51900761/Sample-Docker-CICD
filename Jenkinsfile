pipeline {
  agent any

  environment {
    REGISTRY = 'registry.local:5000'
    FE_IMAGE = "${REGISTRY}/myapp-fe:latest"
    BE_IMAGE = "${REGISTRY}/myapp-be:latest"
  }

  stages {
    stage('Clone') {
      steps {
        git 'https://git.yourdomain.com/your-project.git'
      }
    }

    stage('Build FE') {
      steps {
        sh 'docker build -t $FE_IMAGE -f Dockerfile.fe .'
      }
    }

    stage('Build BE') {
      steps {
        sh 'docker build -t $BE_IMAGE -f Dockerfile.be .'
      }
    }

    stage('Push to Registry') {
      steps {
        sh 'docker push $FE_IMAGE'
        sh 'docker push $BE_IMAGE'
      }
    }

    stage('Deploy') {
      steps {
        sh 'docker-compose down'
        sh 'docker-compose pull'
        sh 'docker-compose up -d'
      }
    }
  }
}
