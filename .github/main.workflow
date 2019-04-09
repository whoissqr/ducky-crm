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
  uses = "actions/bin/curl@master"
  args = ["-s https://detect.synopsys.com/detect.sh --blackduck.url=https://bizdevhub.blackducksoftware.com --detect.project.name=ducky-crm --detect.project.version.name=1.0.2-gautam-actions --blackduck.api.token=MDVlYWEyODQtMzc5NS00NzVkLWJhN2MtN2M4YWY3ZmUwMjJiOjRmNjc0OWEyLWFiZjUtNDgwNS05ZjBjLTllNzJmNjVmYmNhNQ=="]
}

action "Deploy branch filter" {
  needs = ["Synopsys detect"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
