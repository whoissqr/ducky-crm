pipeline {
  agent any
  stages {
    stage('Test Docker') {
      agent any
      steps {
        sh '''#!/bin/bash

docker -v
'''
      }
    }
  }
}