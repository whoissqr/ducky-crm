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
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
