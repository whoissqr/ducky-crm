
pipeline {
  agent none
  stages {
    
    stage('Build') {
      agent { label 'maven-app' }
      steps {
        container('maven') {
          sh 'mvn clean package'
          archiveArtifacts artifacts: '**/target/*.war', fingerprint: true 
        }
      }
    }
    
    stage('Test') {
      agent { label 'detect-app' }
      when {
        expression {
          currentBuild.result == null || currentBuild.result == 'SUCCESS' 
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
