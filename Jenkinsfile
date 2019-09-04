
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
            sh '/bin/bash -s https://detect.synopsys.com/detect.sh \
                --blackduck.url="https://bizdevhub.blackducksoftware.com" \
                --blackduck.api.token="NWU3NzM4MzQtMWU3Yi00MjVkLThkZTMtNTVlNzQyY2Q0ODFkOjdkOWM5NGJiLTRhZDUtNDk3Yy04NDdlLWMyNmFmMDBkYTg4ZA==" \
                --detect.project.name="JenkinsDucky" \
                --detect.project.version.name="${BUILD_TAG}" \
                --detect.policy.check.fail.on.severities=ALL \
                --detect.risk.report.pdf=true \
                --blackduck.trust.cert=true \
                --detect.api.timeout=900000'
          }
        }
      }
    
  }
}
