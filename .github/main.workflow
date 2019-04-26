workflow "Build and Container Scan" {
  on = "push"
  resolves = "Container Detect"
}

action "Docker Convert" {
  needs = ["Docker Build"]
  uses = "actions/action-builder/docker@master"
  runs = "make"
  args = "build"
}

action "Container Detect" {
  needs = ["Docker Convert"]
  uses = "actions/bin/sh@master"
  args = "ls -ltr"
}
