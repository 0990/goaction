workflow "Build and Test" {
  on = "push"
  resolves = ["onlytest"]
}

action "onlytest" {
  uses = "./action-a"
  env = {
    MY_NAME = "Mona"
  }
  args = "\"Hello world, I'm $MY_NAME!\""
}
