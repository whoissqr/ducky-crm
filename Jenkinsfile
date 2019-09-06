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
      steps {
        container('docker') {
          unstash 'builtSources'
          sh 'cat ~/my_password.txt | docker login --username foo --password-stdin \
              docker build -t gautambaghel/cloudbees_detect_app:latest .'
        }

        parallel {
          steps {
            container('detect') {
              sh 'ls'
            }
          }

          steps {
            container('detect') {
              sh 'ls'
            }
          }
        }

      }
    }
  }
}
