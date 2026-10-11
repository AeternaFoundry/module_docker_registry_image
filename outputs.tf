output "registry_images_id" {
  description = "Map of id values across all registry_images, keyed the same as var.registry_images except keys with no id are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.id if v.id != null && length(v.id) > 0 }
}
output "registry_images_auth_config" {
  description = "Map of auth_config values across all registry_images, keyed the same as var.registry_images except keys with no auth_config are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => one(v.auth_config) if v.auth_config != null && length(v.auth_config) > 0 }
  sensitive   = true
}
output "registry_images_build" {
  description = "Map of build values across all registry_images, keyed the same as var.registry_images except keys with no build are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => one(v.build) if v.build != null && length(v.build) > 0 }
}
output "registry_images_insecure_skip_verify" {
  description = "Map of insecure_skip_verify values across all registry_images, keyed the same as var.registry_images except keys with no insecure_skip_verify are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.insecure_skip_verify if v.insecure_skip_verify != null }
}
output "registry_images_keep_remotely" {
  description = "Map of keep_remotely values across all registry_images, keyed the same as var.registry_images except keys with no keep_remotely are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.keep_remotely if v.keep_remotely != null }
}
output "registry_images_name" {
  description = "Map of name values across all registry_images, keyed the same as var.registry_images except keys with no name are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.name if v.name != null && length(v.name) > 0 }
}
output "registry_images_sha256_digest" {
  description = "Map of sha256_digest values across all registry_images, keyed the same as var.registry_images except keys with no sha256_digest are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.sha256_digest if v.sha256_digest != null && length(v.sha256_digest) > 0 }
}
output "registry_images_triggers" {
  description = "Map of triggers values across all registry_images, keyed the same as var.registry_images except keys with no triggers are omitted"
  value       = { for k, v in docker_registry_image.registry_images : k => v.triggers if v.triggers != null && length(v.triggers) > 0 }
}

