pipeline {
  agent {
    docker {
      image 'ruby'
    }
    
  }
  stages {
    stage('Testing') {
      steps {
        sh 'ruby --version'
        echo 'HI!'
      }
    }
  }
}