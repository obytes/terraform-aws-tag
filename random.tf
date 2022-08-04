resource "random_string" "this" {
  count = var.prefix_length_limit != null ? 1 : 0
  length      = 12
  special     = false
  min_numeric = 2
  upper       = false
}
