pipeline {
  agent none
  stages {
    stage('Test') {
      agent { label 'maven-app' }
      steps {
        container('maven') {
          sh 'mvn clean package'
        }
      }
    }
  }
}
