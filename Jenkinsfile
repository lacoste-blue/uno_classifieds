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
              sh '''gem install bundler > /dev/null
bundle install > /dev/null'''
            }
            
            sh 'bundle exec rubocop --format html -o rubocop.html || true'
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
        stage('Syntax') {
          steps {
            sh 'ruby -c **/*.rb'
          }
        }
        stage('Unit') {
          steps {
            retry(count: 2) {
              sh '''gem install bundler
bundle install
'''
            }
            
            catchError() {
              sh '''{
  docker run -dt -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.0.0 > .es_container_id
  sleep 30;
  bundle exec rspec spec --format html --out rspec.html
} || {
  docker kill $(cat .es_container_id)
  exit 1
}

docker kill $(cat .es_container_id)'''
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
                  reportFiles: 'index.html',
                  reportTitles: "Coverage Report",
                  reportName: "Coverage Report"
                ])
              }
              
            }
          }
          stage('Quality') {
            steps {
              retry(count: 2) {
                sh '''gem install bundler
bundle install'''
              }
              
              sh 'bundle exec rubycritic --no-browser'
              script {
                publishHTML(target: [
                  allowMissing: false,
                  alwaysLinkToLastBuild: false,
                  keepAll: true,
                  reportDir: 'tmp/rubycritic',
                  reportFiles: 'overview.html',
                  reportTitles: "Quality Report",
                  reportName: "Quality Report"
                ])
              }
              
            }
          }
        }
      }
      stage('Prep') {
        steps {
          sh '''gem install bundler
bundle install'''
        }
      }
    }
  }