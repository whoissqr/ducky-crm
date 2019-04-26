workflow "Build and Container Scan" {
  on = "push"
  resolves = "Container Detect"
}

action "Lint" {
  uses = "actions/action-builder/shell@master"
  runs = "make"
  args = "lint"
}

action "Test" {
  uses = "actions/action-builder/shell@master"
  runs = "make"
  args = "test"
}

action "Build" {
  needs = ["Lint", "Test"]
  uses = "actions/action-builder/docker@master"
  runs = "make"
  args = "build"
}

action "Container Detect" {
  needs = ["Build"]
  uses = "actions/bin/sh@master"
  args = "ls -ltr"
}
