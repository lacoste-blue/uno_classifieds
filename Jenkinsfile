pipeline {
  agent any
  stages {
    stage('Verify') {
      parallel {
        stage('Lint') {
          steps {
            sh 'echo "Hello world"'
            echo 'Hello World'
          }
        }
        stage('Unit') {
          steps {
            echo 'Hi'
          }
        }
        stage('Syntax') {
          steps {
            echo 'Hi'
          }
        }
      }
    }
    stage('Build') {
      parallel {
        stage('Lint') {
          steps {
            echo 'HI'
          }
        }
        stage('Unit') {
          steps {
            echo 'HI'
          }
        }
        stage('Syntax') {
          steps {
            echo 'HI'
          }
        }
        stage('Quality') {
          steps {
            echo 'hi'
          }
        }
        stage('Publish') {
          steps {
            echo 'sdfg'
          }
        }
      }
    }
    stage('Acceptance') {
      parallel {
        stage('Provision') {
          steps {
            echo 'hi'
          }
        }
        stage('Deploy') {
          steps {
            echo 'hi'
          }
        }
        stage('Smoke') {
          steps {
            echo 'hi'
          }
        }
        stage('Functional') {
          steps {
            echo 'hi'
          }
        }
      }
    }
    stage('Delivered') {
      parallel {
        stage('Provision') {
          steps {
            echo 'hi'
          }
        }
        stage('Deploy') {
          steps {
            echo 'hi'
          }
        }
        stage('Smoke') {
          steps {
            echo 'hi'
          }
        }
        stage('Functional') {
          steps {
            echo 'hi'
          }
        }
      }
    }
  }
}