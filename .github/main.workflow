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
  uses = "gautambaghel/synopsys-detect@master"
  secrets = ["BLACKDUCK_API_TOKEN", "BLACKDUCK_URL"]
  args = "--detect.tools=SIGNATURE_SCAN --detect.project.name=$GITHUB_REPOSITORY"
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
