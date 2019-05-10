workflow "Build and Container Scan" {
  on = "push"
  resolves = "Container Detect"
}

action "Build" {
  uses = "actions/action-builder/docker@master"
  args = "build -t $GITHUB_REPOSITORY ."
}

action "Container Detect" {
  needs = ["Build", "Test"]
  uses = "actions/action-builder/docker@master"
  args = "save $GITHUB_REPOSITORY > $GITHUB_REPOSITORY.tar"
}
