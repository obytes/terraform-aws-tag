output "random_string" {
  value = random_string.this.result
}

output "tags" {
  value = local.tags
}

output "additional_tags" {
  value = local.additional_tag
}

output "id" {
  value = local.id
}

output "id_full" {
  value = local.id_full
}
