locals {

  # GITHUB_TOKEN should be set for Github provider to work
  # GITHUB_ORGANIZATION should be set if deploying in another ORG and not your
  # github user

  flux2 = merge(
    {
      enabled                  = false
      create_ns                = true
      namespace                = "flux-system"
      target_path              = "production"
      default_network_policy   = true
      version                  = "v0.9.0"
      github_url               = "ssh://git@<host>/<org>/<repository>"
      create_github_repository = false
      github_token             = ""
      repository               = "gitops"
      repository_visibility    = "public"
      branch                   = "main"
      flux_sync_branch         = ""
      default_components       = ["source-controller", "kustomize-controller", "helm-controller", "notification-controller"]
      components               = []
      provider                 = "github"
      auto_image_update        = false

      known_hosts = [
        "github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==",
        "gitlab.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsj2bNKTBSpIYDEGk9KxsGh3mySTRgMtXL583qmBpzeQ+jqCMRgBqB98u3z++J1sKlXHWfM9dyhSevkMwSbhoR8XIq/U0tCNyokEi/ueaBMCvbcTHhO7FcwzY92WK4Yt0aGROY5qX2UKSeOvuP4D6TPqKF1onrSzH9bx9XUf2lEdWT/ia1NEKjunUqu1xOB/StKDHMoX4/OKyIzuS0q/T1zOATthvasJFoPrAjkohTyaDUz2LN5JoH839hViyEG82yB+MjcFV5MU3N1l1QL3cVUCh93xSaua1N85qivl+siMkPGbO5xR/En4iEY6K2XPASUEMaieWVNTRCtJ4S8H+9"
      ]
    },
    var.flux2
  )

  apply = local.flux2["enabled"] ? [for v in data.kubectl_file_documents.apply[0].documents : {
    data : yamldecode(v)
    content : v
    }
  ] : null

  sync = local.flux2["enabled"] ? [for v in data.kubectl_file_documents.sync[0].documents : {
    data : yamldecode(v)
    content : v
    }
  ] : null
}

resource "kubernetes_namespace" "flux2" {
  count = local.flux2["enabled"] && local.flux2["create_ns"] ? 1 : 0

  metadata {
    labels = {
      name = local.flux2["namespace"]
    }

    name = local.flux2["namespace"]
  }
  lifecycle {
    ignore_changes = [
      metadata[0].labels,
    ]
  }
}

resource "tls_private_key" "identity" {
  count     = local.flux2["enabled"] ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

data "flux_install" "main" {
  count          = local.flux2["enabled"] ? 1 : 0
  namespace      = local.flux2["namespace"]
  target_path    = local.flux2["target_path"]
  network_policy = false
  version        = local.flux2["version"]
  components     = distinct(concat(local.flux2["default_components"], local.flux2["components"], local.flux2["auto_image_update"] ? ["image-reflector-controller", "image-automation-controller"] : []))
}

# Split multi-doc YAML with
# https://registry.terraform.io/providers/gavinbunney/kubectl/latest
data "kubectl_file_documents" "apply" {
  count   = local.flux2["enabled"] ? 1 : 0
  content = data.flux_install.main[0].content
}

# Apply manifests on the cluster
resource "kubectl_manifest" "apply" {
  for_each   = local.flux2["enabled"] ? { for v in local.apply : lower(join("/", compact([v.data.apiVersion, v.data.kind, lookup(v.data.metadata, "namespace", ""), v.data.metadata.name]))) => v.content } : {}
  depends_on = [kubernetes_namespace.flux2]
  yaml_body  = each.value
}

# Generate manifests
data "flux_sync" "main" {
  count       = local.flux2["enabled"] ? 1 : 0
  target_path = local.flux2["target_path"]
  url         = local.flux2["github_url"]
  branch      = local.flux2["flux_sync_branch"] != "" ? local.flux2["flux_sync_branch"] : local.flux2["branch"]
  namespace   = local.flux2["namespace"]
}

# Split multi-doc YAML with
# https://registry.terraform.io/providers/gavinbunney/kubectl/latest
data "kubectl_file_documents" "sync" {
  count   = local.flux2["enabled"] ? 1 : 0
  content = data.flux_sync.main[0].content
}

# Apply manifests on the cluster
resource "kubectl_manifest" "sync" {
  for_each = local.flux2["enabled"] ? { for v in local.sync : lower(join("/", compact([v.data.apiVersion, v.data.kind, lookup(v.data.metadata, "namespace", ""), v.data.metadata.name]))) => v.content } : {}
  depends_on = [
    kubernetes_namespace.flux2,
    kubectl_manifest.apply
  ]
  yaml_body = each.value
}

# Generate a Kubernetes secret with the Git credentials
resource "kubernetes_secret" "main" {
  count      = local.flux2["enabled"] ? 1 : 0
  depends_on = [kubectl_manifest.apply]

  metadata {
    name      = data.flux_sync.main[0].name
    namespace = data.flux_sync.main[0].namespace
  }

  data = {
    "identity.pub" = tls_private_key.identity[0].public_key_pem
    identity       = tls_private_key.identity[0].private_key_pem
    known_hosts    = join("\n", local.flux2["known_hosts"])
  }
}

# GitHub
resource "github_repository" "main" {
  count      = local.flux2["enabled"] && local.flux2["create_github_repository"] && (local.flux2["provider"] == "github") ? 1 : 0
  name       = local.flux2["repository"]
  visibility = local.flux2["repository_visibility"]
  auto_init  = true
}

data "github_repository" "main" {
  count = local.flux2["enabled"] && !local.flux2["create_github_repository"] && (local.flux2["provider"] == "github") ? 1 : 0
  name  = local.flux2["repository"]
}

resource "github_branch_default" "main" {
  count      = local.flux2["enabled"] && local.flux2["create_github_repository"] && (local.flux2["provider"] == "github") ? 1 : 0
  repository = local.flux2["create_github_repository"] ? github_repository.main[0].name : data.github_repository.main[0].name
  branch     = local.flux2["branch"]
}

resource "github_repository_deploy_key" "main" {
  count      = local.flux2["enabled"] && (local.flux2["provider"] == "github") ? 1 : 0
  title      = "flux-${local.flux2["create_github_repository"] ? github_repository.main[0].name : local.flux2["repository"]}-${local.flux2["branch"]}"
  repository = local.flux2["create_github_repository"] ? github_repository.main[0].name : data.github_repository.main[0].name
  key        = tls_private_key.identity[0].public_key_openssh
  read_only  = !local.flux2["auto_image_update"]
}

resource "github_repository_file" "install" {
  count               = local.flux2["enabled"] && (local.flux2["provider"] == "github") ? 1 : 0
  repository          = local.flux2["create_github_repository"] ? github_repository.main[0].name : data.github_repository.main[0].name
  file                = data.flux_install.main[0].path
  content             = data.flux_install.main[0].content
  branch              = local.flux2["branch"]
  overwrite_on_create = true
}

resource "github_repository_file" "sync" {
  count               = local.flux2["enabled"] && (local.flux2["provider"] == "github") ? 1 : 0
  repository          = local.flux2["create_github_repository"] ? github_repository.main[0].name : data.github_repository.main[0].name
  file                = data.flux_sync.main[0].path
  content             = data.flux_sync.main[0].content
  branch              = local.flux2["branch"]
  overwrite_on_create = true
}

resource "github_repository_file" "kustomize" {
  count               = local.flux2["enabled"] && (local.flux2["provider"] == "github") ? 1 : 0
  repository          = local.flux2["create_github_repository"] ? github_repository.main[0].name : data.github_repository.main[0].name
  file                = data.flux_sync.main[0].kustomize_path
  content             = data.flux_sync.main[0].kustomize_content
  branch              = local.flux2["branch"]
  overwrite_on_create = true
}

resource "kubernetes_network_policy" "flux2_allow_monitoring" {
  count = local.flux2["enabled"] && local.flux2["default_network_policy"] ? 1 : 0

  metadata {
    name      = "${local.flux2["create_ns"] ? kubernetes_namespace.flux2.*.metadata.0.name[count.index] : local.flux2["namespace"]}-allow-monitoring"
    namespace = local.flux2["create_ns"] ? kubernetes_namespace.flux2.*.metadata.0.name[count.index] : local.flux2["namespace"]
  }

  spec {
    pod_selector {
    }

    ingress {
      ports {
        port     = "8080"
        protocol = "TCP"
      }

      from {
        namespace_selector {
          match_labels = {
            "${local.labels_prefix}/component" = "monitoring"
          }
        }
      }
    }

    policy_types = ["Ingress"]
  }
}

resource "kubernetes_network_policy" "flux2_allow_namespace" {
  count = local.flux2["enabled"] && local.flux2["default_network_policy"] ? 1 : 0

  metadata {
    name      = "${local.flux2["create_ns"] ? kubernetes_namespace.flux2.*.metadata.0.name[count.index] : local.flux2["namespace"]}-allow-namespace"
    namespace = local.flux2["create_ns"] ? kubernetes_namespace.flux2.*.metadata.0.name[count.index] : local.flux2["namespace"]
  }

  spec {
    pod_selector {
    }

    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = local.flux2["create_ns"] ? kubernetes_namespace.flux2.*.metadata.0.name[count.index] : local.flux2["namespace"]
          }
        }
      }
    }

    policy_types = ["Ingress"]
  }
}

