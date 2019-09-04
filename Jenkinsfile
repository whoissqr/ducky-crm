pipeline {
  agent none
  stages {
    stage('Test') {
      agent { label 'maven-app' }
      steps {
        container('maven') {
          echo 'Hello World!'   
          sh 'java -version'
        }
      }
    }
  }
}
