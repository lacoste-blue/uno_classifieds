pipeline {
  agent {
    node {
      label 'application'
    }
    
  }
  stages {
    stage('Verify') {
      parallel {
        stage('Lint') {
          steps {
            retry(count: 2) {
              sh '''gem install bundler 
bundle install 

bundle exec rubocop --format html -o rubocop.html || true'''
            }
            
            script {
              publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: '',
                reportFiles: 'rubocop.html',
                reportTitles: "Lint Report",
                reportName: "Lint Report"
              ])
            }
            
          }
        }
        stage('Unit') {
          steps {
            catchError() {
              retry(count: 2) {
                sh '''gem install bundler
bundle install


{
  docker run -dt -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.0.0 > .es_container_id
  sleep 30;
  bundle exec rspec spec --format html --out rspec.html
} || {
  docker kill $(cat .es_container_id)
  exit 1
}

docker kill $(cat .es_container_id)'''
              }
              
            }
            
            script {
              publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: '',
                reportFiles: 'rspec.html',
                reportTitles: "Unit Test Report",
                reportName: "Unit Test Report"
              ])
              
              publishHTML(target: [
                allowMissing: false,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: 'coverage',
                reportFiles: 'rcov/index.html',
                reportTitles: "Coverage Report",
                reportName: "Coverage Report"
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