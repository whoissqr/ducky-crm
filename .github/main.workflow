workflow "Build and Detect" {
  on = "push"
  resolves = "Deploy branch filter"
}

action "Build" {
  uses = "./maven-cli"
  args = ["clean package"]
}

action "Synopsys detect" {
  needs = ["Build"]
  uses = "./actions-detect"
  secrets = ["BLACKDUCK_API_TOKEN"]
  args = " \
  --blackduck.url="https://bizdevhub.blackducksoftware.com" \
  --detect.project.version.name=1.0.2-gautam-actions-fixed \
  --detect.tools=SIGNATURE_SCAN \
  --detect.project.name="DuckyCrmActions-Fixed" \
  --blackduck.trust.cert=true \
  --detect.report.timeout=900 \"
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
