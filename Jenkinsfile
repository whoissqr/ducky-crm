pipeline {
  agent any
  stages {
    stage('Test Docker') {
      agent {
        docker {
          image 'maven:3.5-jdk-8-alpine'
          args 'mvn clean package -DskipTests'
        }

      }
      steps {
        sh '''#!/bin/bash

docker -v
'''
      }
    }
  }
}