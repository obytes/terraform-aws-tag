resource "random_string" "this" {
  length      = 12
  special     = false
  min_numeric = 2
  upper       = false
}
