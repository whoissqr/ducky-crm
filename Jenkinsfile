pipeline {
  agent none
  stages {

    stage('Build') {
      agent { label 'maven-app' }
      steps {
        container('maven') {
          sh 'mvn clean package'
          stash includes: 'target/**', name: 'builtSources'
        }
      }
    }

    stage('Upload') {
          agent { label 'docker-app' }
          when {
            expression {
              currentBuild.result == null || currentBuild.result == 'SUCCESS'
            }
          }

          parallel {
            steps {
              container('docker-with-detect') {
                unstash 'builtSources'
                sh 'cat my_password.txt | docker login --username foo --password-stdin \
                    docker build -t gautambaghel/cloudbees_detect_app:latest .'
                sh 'ls'
                sh 'java -version'
                sh 'docker --version'
                sh 'wget --version'
              }
            }

            steps {
              container('detect') {
                sh 'ls'
                sh 'java -version'
              }
            }
          }

      }
    }
  }
}
