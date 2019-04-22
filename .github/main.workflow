workflow "Build and Polaris" {
  on = "push"
  resolves = "Polaris"
}

action "Polaris" {
  uses = "gautambaghel/synopsys-detect@master"
  secrets = ["SWIP_ACCESS_TOKEN", "SWIP_SERVER_URL"]
  args = "--detect.tools=POLARIS --detect.project.name=$GITHUB_REPOSITORY --polaris.url=$SWIP_SERVER_URL --polaris.access.token=SWIP_ACCESS_TOKEN"
}
