workflow "Build and Container Scan" {
  on = "push"
  resolves = "Synopsys Detect"
}

action "Build Maven" {
  uses = "./maven-cli"
  args = ["clean package"]
}

action "Build Container" {
  needs = ["Build Maven"]
  uses = "actions/docker/cli@master"
  args = "build -t $GITHUB_REPOSITORY ."
}

action "Synopsys Detect" {
  needs = ["Build Container"]
  uses = "gautambaghel/synopsys-detect@master"
  secrets = ["BLACKDUCK_URL","BLACKDUCK_API_TOKEN","SWIP_ACCESS_TOKEN", "SWIP_SERVER_URL"]
  args = "--detect.tools=DOCKER --detect.project.name=$GITHUB_REPOSITORY --detect.docker.image=$GITHUB_REPOSITORY"
}
