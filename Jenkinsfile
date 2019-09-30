pipeline {
  agent none
  stages {

      stage('Build') {
        agent { label 'maven-app' }
        steps {
          container('maven') {
            sh 'mvn clean package'
            stash includes: 'target/', name: 'builtSources'
          }
        }
      }

  }
}
