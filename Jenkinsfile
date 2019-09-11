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
          parallel(
            a: {
              echo "This is branch a"
              sh "docker -v"
              sh "java -version"
              
            },
            b: {
              echo "This is branch b"
              sh "docker -v"
              sh "java -version"
            }
          )
        }
 
      }
    
  }
}
