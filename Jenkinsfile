pipeline {
  agent {
    node {
      label 'application'
    }
    
  }
  stages {
    stage('Prep') {
      steps {
        sh '''gem install bundler
bundle install'''
      }
    }
    stage('Verify') {
      parallel {
        stage('Lint') {
          steps {
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
      stage('Acceptance - Provision') {
        parallel {
          stage('Deploy') {
            steps {
              sh 'eb deploy uno-classifieds-acceptance'
            }
          }
          stage('Check deploy') {
            steps {
              sh '''# Give the API some time to update
sleep 15
while [ -n "$(aws elasticbeanstalk describe-environments --environment-names "uno-classifieds-acceptance" --region us-east-1 | grep \'Updating\')" ]; do
  sleep 15
  echo "The environment is not yet ready..."
done

sleep 15

# Check if environment is green.
aws elasticbeanstalk describe-environments --environment-names "uno-classifieds-acceptance" --region us-east-1 | grep "Health" | cut -d\':\' -f2 | cut -d\'"\' -f2 | grep \'Green\''''
            }
          }
        }
      }
    }
  }