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
  args = "--detect.tools=SIGNATURE_SCAN --detect.project.name=$GITHUB_REPOSITORY --polaris.url=https://sipse.polaris.synopsys.com --polaris.access.token=nresfs58d55nb3d7c8s52luj2a2iciiiicnielsdae3uesi95850"
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
