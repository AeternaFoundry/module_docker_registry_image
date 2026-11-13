output "registry_images_id" {
  description = "Map of id values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.id }
}
output "registry_images_auth_config" {
  description = "Map of auth_config values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => one(v.auth_config) }
  sensitive   = true
}
output "registry_images_build" {
  description = "Map of build values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => one(v.build) }
}
output "registry_images_insecure_skip_verify" {
  description = "Map of insecure_skip_verify values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.insecure_skip_verify }
}
output "registry_images_keep_remotely" {
  description = "Map of keep_remotely values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.keep_remotely }
}
output "registry_images_name" {
  description = "Map of name values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.name }
}
output "registry_images_sha256_digest" {
  description = "Map of sha256_digest values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.sha256_digest }
}
output "registry_images_triggers" {
  description = "Map of triggers values across all registry_images, keyed the same as var.registry_images"
  value       = { for k, v in docker_registry_image.registry_images : k => v.triggers }
}

