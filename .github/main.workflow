workflow "Build and Detect" {
  on = "push"
  resolves = "Deploy branch filter"
}

action "Build" {
  uses = "./maven-cli"
  args = ["clean package"]
}

action "Synopsys detect" {
  uses = "gautambaghel/synopsys-detect@master"
  secrets = ["SWIP_ACCESS_TOKEN", "SWIP_SERVER_URL"]
  env = {
      BASE_IMG="node:10.15.1"
  }
}

action "Deploy branch filter" {
  needs = ["Synopsys detect", "Build"]
  uses = "actions/bin/filter@master"
  args = "branch master"
}
