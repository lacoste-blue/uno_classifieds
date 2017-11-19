pipeline {
  agent any
  stages {
    stage('Verify') {
      parallel {
        stage('Lint') {
          steps {
            sh '''gem install bundler 
bundle install 

bundle exec rubocop --format html -o rubocop.html || true'''
            script {
              publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: '',
                reportFiles: 'rubocop.html',
                reportTitles: "Rubocop Report",
                reportName: "Rubocop Report"
              ])
            }
            
          }
        }
        stage('Unit') {
          steps {
            sh '''gem install bundler
bundle install

bundle exec rspec spec --format html --out rspec.html'''
            script {
              publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: '',
                reportFiles: 'rspec.html',
                reportTitles: "RSpec Report",
                reportName: "RSpec Report"
              ])
            }
            
          }
        }
        stage('Syntax') {
          steps {
            sh 'ruby -c **/*.rb'
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