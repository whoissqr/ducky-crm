workflow "Build and Detect" {
  on = "push"
  resolves = "Docker Detect"
}

action "Build" {
  uses = "actions/docker/cli@master"
  args = ["build", "-t", "synopsys-actions", "."]
}

action "Deploy branch filter" {
  needs = ["Build"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}

