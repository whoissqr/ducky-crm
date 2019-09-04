pipeline {
  agent none
  stages {
    
    stage('Build') {
      agent { label 'maven-app' }
      steps {
        container('maven') {
          sh 'mvn clean package'
        }
      }
      post {
        success {
          junit 'target/*' 
        }
      }
    }
    
    stage('Test') {
      agent { label 'detect-app' }
      steps {
        container('detect') {
          sh 'ls'
        }
      }
    }
    
  }
}
