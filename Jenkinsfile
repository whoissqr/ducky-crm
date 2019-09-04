
pipeline {
  agent none
  stages {
    
      stage('Build') {
        agent { label 'maven-app' }
        steps {
          container('maven') {
            sh 'mvn clean package'
            sh 'ls'
            stash includes: 'target/*', name: 'builtSources'
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
            sh 'wget https://detect.synopsys.com/detect.sh'
            sh 'chmod +x detect.sh'
            unstash 'builtSources' 
            sh 'ls'
          }
        }
      }
    
  }
}
