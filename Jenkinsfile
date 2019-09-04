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
    }
    
    stage('Detect') {
      agent { label 'detect-app' }
      steps {
        container('detect') {
          sh 'curl -s "https://detect.synopsys.com/detect.sh" \
              --blackduck.url="https://bizdevhub.blackducksoftware.com" \
              --blackduck.api.token="NWU3NzM4MzQtMWU3Yi00MjVkLThkZTMtNTVlNzQyY2Q0ODFkOjdkOWM5NGJiLTRhZDUtNDk3Yy04NDdlLWMyNmFmMDBkYTg4ZA==" \
              --detect.project.name="CloudBeesDucky" \
              --detect.project.version.name="${BUILD_TAG}" \
              --detect.risk.report.pdf=true \
              --blackduck.trust.cert=true \
              --detect.api.timeout=900000'
        }
      }
    }
    
  }
}
