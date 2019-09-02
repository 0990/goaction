workflow "Build and Test" {
  on = "push"
  resolves = [
    "onlytest",
    "codecov/codecov-action@v1.0.0",
  ]
}

action "onlytest" {
  uses = "./action-a"
  env = {
    MY_NAME = "Mona"
  }
  args = "\"Hello world, I'm $MY_NAME!\""
}

action "Setup Go for use with actions" {
  uses = "actions/setup-go@v1"
}

action "checkout code" {
  uses = "actions/checkout@v1"
  needs = ["Setup Go for use with actions"]
}

action "codecov/codecov-action@v1.0.0" {
  uses = "codecov/codecov-action@v1.0.0"
  needs = ["checkout code"]
}

workflow "New workflow" {
  on = "push"
}
