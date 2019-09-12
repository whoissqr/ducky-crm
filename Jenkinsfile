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
            sh 'docker save -o /opt/blackduck/shared/target/cloudbees_detect_app.tar cloudbees_detect_app:latest'
            sh './detect.sh \
                    --blackduck.url="https://bizdevhub.blackducksoftware.com" \
                    --blackduck.api.token="MDVlYWEyODQtMzc5NS00NzVkLWJhN2MtN2M4YWY3ZmUwMjJiOjRmNjc0OWEyLWFiZjUtNDgwNS05ZjBjLTllNzJmNjVmYmNhNQ==" \
                    --blackduck.trust.cert=true \
                    --logging.level.com.synopsys.integration=DEBUG \
                    --detect.project.name="CloudBeesDucky" \
                    --detect.tools="DOCKER" \
                    --detect.docker.image="cloudbees_detect_app:latest" \
                    --detect.project.version.name="DOCKER_${BUILD_TAG}" \
                    --detect.risk.report.pdf=true \
                    --detect.report.timeout=9000 \
                    --detect.docker.passthrough.imageinspector.service.url="http://blackduck-imageinspector-alpine.blackduck-imageinspector" \
                    --detect.docker.passthrough.shared.dir.path.local="/opt/blackduck/shared/" \
                    --detect.docker.passthrough.shared.dir.path.imageinspector="/opt/blackduck/shared" \
                    --detect.docker.passthrough.imageinspector.service.start=false'
            archiveArtifacts artifacts: '**/*.pdf', fingerprint: true, onlyIfSuccessful: true
            sh 'docker push gautambaghel/cloudbees_detect_app:latest'
          }
        }
      }
          
  }
}
