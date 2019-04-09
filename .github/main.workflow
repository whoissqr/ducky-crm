workflow "Build and Detect" {
  on = "push"
  resolves = "Deploy branch filter"
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = ["build", "-t", "ducky-crm", "."]
}

action "Deploy branch filter" {
  needs = ["Build"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
