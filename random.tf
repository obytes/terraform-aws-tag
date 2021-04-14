resource "random_string" "this" {
  count       = var.random_string != null ? 0 : 1
  length      = 12
  special     = false
  min_numeric = 2
  upper       = false
}
