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

    stage('Scan + Upload') {
      agent { label 'docker-app' }
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS'
        }
      }
      steps {
        container('docker-with-detect') {
          unstash 'builtSources'
          sh 'cat my_password.txt | docker login --username foo --password-stdin'
          sh 'docker build -t gautambaghel/cloudbees_detect_app:latest .'
          sh 'ls'
          sh 'java -version'
        }
      }
    }
    
  }
}
