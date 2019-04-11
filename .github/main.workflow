workflow "Build and Detect" {
  on = "push"
  resolves = "Deploy branch filter"
}

action "Build" {
  uses = "./actions-cli"
  args = ["build", "-t", "$GITHUB_REPOSITORY", "."]
}

action "Synopsys detect" {
  needs = ["Build"]
  uses = "./actions-detect"
  secrets = ["BLACKDUCK_API_TOKEN"]
  env = {
     BLACKDUCK_URL="https://bizdevhub.blackducksoftware.com"
  }
  args = "--detect.project.version.name=1.0.2-gautam-actions --detect.tools=SIGNATURE_SCAN"
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
