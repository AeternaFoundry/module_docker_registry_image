variable "registry_images" {
  description = <<EOT
Map of registry_images, attributes below
Required:
    - name
Optional:
    - insecure_skip_verify
    - keep_remotely
    - triggers
    - auth_config (block):
        - address (required)
        - password (optional)
        - username (optional)
    - build (block):
        - additional_contexts (optional)
        - auth_config (optional, block):
            - auth (optional)
            - email (optional)
            - host_name (required)
            - identity_token (optional)
            - password (optional)
            - registry_token (optional)
            - server_address (optional)
            - user_name (optional)
        - build_args (optional)
        - build_id (optional)
        - build_log_file (optional)
        - builder (optional)
        - cache_from (optional)
        - cache_to (optional)
        - cgroup_parent (optional)
        - context (required)
        - cpu_period (optional)
        - cpu_quota (optional)
        - cpu_set_cpus (optional)
        - cpu_set_mems (optional)
        - cpu_shares (optional)
        - dockerfile (optional)
        - extra_hosts (optional)
        - force_remove (optional)
        - isolation (optional)
        - label (optional)
        - labels (optional)
        - memory (optional)
        - memory_swap (optional)
        - network_mode (optional)
        - no_cache (optional)
        - platform (optional)
        - provenance (optional)
        - pull_parent (optional)
        - remote_context (optional)
        - remove (optional)
        - sbom (optional)
        - secrets (optional, block):
            - env (optional)
            - id (required)
            - src (optional)
        - security_opt (optional)
        - session_id (optional)
        - shm_size (optional)
        - squash (optional)
        - suppress_output (optional)
        - tag (optional)
        - target (optional)
        - ulimit (optional, block):
            - hard (required)
            - name (required)
            - soft (required)
        - use_legacy_builder (optional)
        - version (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name                 = string
    insecure_skip_verify = optional(bool)
    keep_remotely        = optional(bool)
    triggers             = optional(map(string))
    auth_config = optional(object({
      address  = string
      password = optional(string)
      username = optional(string)
    }))
    build = optional(object({
      additional_contexts = optional(list(string))
      auth_config = optional(list(object({
        auth           = optional(string)
        email          = optional(string)
        host_name      = string
        identity_token = optional(string)
        password       = optional(string)
        registry_token = optional(string)
        server_address = optional(string)
        user_name      = optional(string)
      })))
      build_args     = optional(map(string))
      build_id       = optional(string)
      build_log_file = optional(string)
      builder        = optional(string)
      cache_from     = optional(list(string))
      cache_to       = optional(list(string))
      cgroup_parent  = optional(string)
      context        = string
      cpu_period     = optional(number)
      cpu_quota      = optional(number)
      cpu_set_cpus   = optional(string)
      cpu_set_mems   = optional(string)
      cpu_shares     = optional(number)
      dockerfile     = optional(string)
      extra_hosts    = optional(list(string))
      force_remove   = optional(bool)
      isolation      = optional(string)
      label          = optional(map(string))
      labels         = optional(map(string))
      memory         = optional(number)
      memory_swap    = optional(number)
      network_mode   = optional(string)
      no_cache       = optional(bool)
      platform       = optional(string)
      provenance     = optional(string)
      pull_parent    = optional(bool)
      remote_context = optional(string)
      remove         = optional(bool)
      sbom           = optional(string)
      secrets = optional(list(object({
        env = optional(string)
        id  = string
        src = optional(string)
      })))
      security_opt    = optional(list(string))
      session_id      = optional(string)
      shm_size        = optional(number)
      squash          = optional(bool)
      suppress_output = optional(bool)
      tag             = optional(list(string))
      target          = optional(string)
      ulimit = optional(list(object({
        hard = number
        name = string
        soft = number
      })))
      use_legacy_builder = optional(bool)
      version            = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

