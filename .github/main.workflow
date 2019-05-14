workflow "Build and Container Scan" {
  on = "push"
  resolves = "Container Detect"
}

action "Build" {
  uses = "actions/action-builder/docker@master"
  args = "build -t $GITHUB_REPOSITORY ."
}

action "Save to Tar" {
  needs = ["Build"]
  uses = "actions/action-builder/docker@master"
  args = "save $GITHUB_REPOSITORY > $GITHUB_REPOSITORY.tar"
}

action "Synopsys Detect" {
  needs = ["Save to Tar"]
  uses = "gautambaghel/synopsys-detect@master"
  secrets = ["BLACKDUCK_URL","BLACKDUCK_API_TOKEN","SWIP_ACCESS_TOKEN", "SWIP_SERVER_URL"]
  args = "--detect.tools=SIGNATURE_SCAN --detect.project.name=ACTION_CONTAINER_SCAN --detect.source.path=$GITHUB_REPOSITORY.tar"
}
