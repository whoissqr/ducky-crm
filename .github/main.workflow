workflow "Build and Detect" {
  on = "push"
  resolves = "Deploy branch filter"
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = ["build", "-t", "ducky-crm", "."]
}

action "Synopsys detect" {
  needs = ["Build"]
  uses = "./actions-detect"
  secrets = ["BLACKDUCK_API_TOKEN"]
  env = {
     BLACKDUCK_URL="https://bizdevhub.blackducksoftware.com"
  }
  args = "$BLACKDUCK_URL"
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
