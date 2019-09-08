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
        container('docker-with-detect') {
          unstash 'builtSources'
          sh 'cat my_password.txt | docker login --username gautambaghel --password-stdin'
          sh 'docker build -t gautambaghel/cloudbees_detect_app:latest .'
          sh 'wget https://detect.synopsys.com/detect.sh'
          sh 'chmod +x detect.sh'
          sh './detect.sh \
              --blackduck.url="https://bizdevhub.blackducksoftware.com" \
              --blackduck.api.token="MDVlYWEyODQtMzc5NS00NzVkLWJhN2MtN2M4YWY3ZmUwMjJiOjRmNjc0OWEyLWFiZjUtNDgwNS05ZjBjLTllNzJmNjVmYmNhNQ==" \
              --blackduck.trust.cert=true \
              --detect.project.name="CloudBeesDucky" \
              --detect.tools="DOCKER" \
              --detect.docker.image="gautambaghel/cloudbees_detect_app:latest" \
              --detect.project.version.name="DOCKER_${BUILD_TAG}" \
              --detect.risk.report.pdf=true \
              --detect.report.timeout=9000'
          sh 'docker push gautambaghel/cloudbees_detect_app:latest'
        }
      }
    }
  }
}
