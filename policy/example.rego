package policy


default allow = false

allow {
   input.user.username == "john"
   input.user.roles[_] == "developer"
}