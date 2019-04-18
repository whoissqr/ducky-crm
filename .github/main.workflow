workflow "Build and Polaris" {
  on = "push"
  resolves = "Polaris"
}

action "Polaris" {
  uses = "./polaris"
  secrets = ["SWIP_ACCESS_TOKEN", "SWIP_SERVER_URL"]
  env = {
      BASE_IMG="node:10.15.1"
  }
  args = "$BASE_IMG"
}
