workflow "New workflow" {
  on = "push"
  resolves = ["new-action"]
}

action "new-action" {
    uses = "./action-a"
   env = {
    MY_NAME = "Mona"
  }
  args = "\"Hello world, I'm $MY_NAME!\""
}
