pipeline {
  agent any
  stages {
    stage('Build the Application') {
      steps {
        git(url: 'https://github.com/gautambaghel/ducky-crm.git', branch: 'master')
      }
    }
    stage('Test Docker') {
      agent {
        docker {
          image 'maven:3.5-jdk-8-alpine'
          args 'mvn clean package -DskipTests'
        }

      }
      steps {
        echo 'docker -v'
      }
    }
  }
}