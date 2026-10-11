resource "docker_registry_image" "registry_images" {
  for_each = var.registry_images

  name                 = each.value.name
  insecure_skip_verify = each.value.insecure_skip_verify
  keep_remotely        = each.value.keep_remotely
  triggers             = each.value.triggers

  dynamic "auth_config" {
    for_each = each.value.auth_config != null ? [each.value.auth_config] : []
    content {
      address  = auth_config.value.address
      password = auth_config.value.password
      username = auth_config.value.username
    }
  }

  dynamic "build" {
    for_each = each.value.build != null ? [each.value.build] : []
    content {
      additional_contexts = build.value.additional_contexts
      dynamic "auth_config" {
        for_each = build.value.auth_config != null ? build.value.auth_config : []
        content {
          auth           = auth_config.value.auth
          email          = auth_config.value.email
          host_name      = auth_config.value.host_name
          identity_token = auth_config.value.identity_token
          password       = auth_config.value.password
          registry_token = auth_config.value.registry_token
          server_address = auth_config.value.server_address
          user_name      = auth_config.value.user_name
        }
      }
      build_args     = build.value.build_args
      build_id       = build.value.build_id
      build_log_file = build.value.build_log_file
      builder        = build.value.builder
      cache_from     = build.value.cache_from
      cache_to       = build.value.cache_to
      cgroup_parent  = build.value.cgroup_parent
      context        = build.value.context
      cpu_period     = build.value.cpu_period
      cpu_quota      = build.value.cpu_quota
      cpu_set_cpus   = build.value.cpu_set_cpus
      cpu_set_mems   = build.value.cpu_set_mems
      cpu_shares     = build.value.cpu_shares
      dockerfile     = build.value.dockerfile
      extra_hosts    = build.value.extra_hosts
      force_remove   = build.value.force_remove
      isolation      = build.value.isolation
      label          = build.value.label
      labels         = build.value.labels
      memory         = build.value.memory
      memory_swap    = build.value.memory_swap
      network_mode   = build.value.network_mode
      no_cache       = build.value.no_cache
      platform       = build.value.platform
      provenance     = build.value.provenance
      pull_parent    = build.value.pull_parent
      remote_context = build.value.remote_context
      remove         = build.value.remove
      sbom           = build.value.sbom
      dynamic "secrets" {
        for_each = build.value.secrets != null ? build.value.secrets : []
        content {
          env = secrets.value.env
          id  = secrets.value.id
          src = secrets.value.src
        }
      }
      security_opt    = build.value.security_opt
      session_id      = build.value.session_id
      shm_size        = build.value.shm_size
      squash          = build.value.squash
      suppress_output = build.value.suppress_output
      tag             = build.value.tag
      target          = build.value.target
      dynamic "ulimit" {
        for_each = build.value.ulimit != null ? build.value.ulimit : []
        content {
          hard = ulimit.value.hard
          name = ulimit.value.name
          soft = ulimit.value.soft
        }
      }
      use_legacy_builder = build.value.use_legacy_builder
      version            = build.value.version
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

