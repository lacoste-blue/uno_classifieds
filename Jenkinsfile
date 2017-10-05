pipeline {
  agent any
  stages {
    stage('Verify Lint') {
      steps {
        parallel(
          "Verify Lint": {
            sh 'echo "Hello world"'
            echo 'HI!'
            
          },
          "Verify Unit": {
            echo 'Hi'
            
          },
          "Verify Syntax": {
            echo 'Hi'
            
          }
        )
      }
    }
    stage('Build Lint') {
      steps {
        parallel(
          "Build Lint": {
            echo 'HI'
            
          },
          "Build Unit": {
            echo 'HI'
            
          },
          "Build Syntax": {
            echo 'HI'
            
          },
          "Build Quality": {
            echo 'hi'
            
          },
          "Build Publish": {
            echo 'Hi'
            
          }
        )
      }
    }
    stage('Acceptance Provision') {
      steps {
        parallel(
          "Acceptance Provision": {
            echo 'hi'
            
          },
          "Acceptance Deploy": {
            echo 'hi'
            
          },
          "Acceptance Smoke": {
            echo 'hi'
            
          },
          "Acceptance Functional": {
            echo 'hi'
            
          }
        )
      }
    }
    stage('Delivered Provision') {
      steps {
        parallel(
          "Delivered Provision": {
            echo 'hi'
            
          },
          "Delivered Deploy": {
            echo 'hi'
            
          },
          "Delivered Smoke": {
            echo 'hi'
            
          },
          "Delivered Functional": {
            echo 'hi'
            
          }
        )
      }
    }
  }
}