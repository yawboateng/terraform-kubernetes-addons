# terraform-kubernetes-addons

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-kubernetes-addons)
[![terraform-kubernetes-addons](https://github.com/particuleio/terraform-kubernetes-addons/workflows/terraform-kubernetes-addons/badge.svg)](https://github.com/particuleio/terraform-kubernetes-addons/actions?query=workflow%3Aterraform-kubernetes-addons)

## Main components

| Name                                                                                                                          | Description                                                                                      | Generic             | AWS                 | Scaleway            | GCP                 | Azure               |
|------|-------------|:-------:|:---:|:--------:|:---:|:-----:|
| [admiralty](https://admiralty.io/)                                                                                            | A system of Kubernetes controllers that intelligently schedules workloads across clusters        | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [aws-ebs-csi-driver](https://github.com/kubernetes-sigs/aws-ebs-csi-driver)                                                   | Enable new feature and the use of `gp3` volumes                                                  | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [aws-efs-csi-driver](https://github.com/kubernetes-sigs/aws-efs-csi-driver)                                                   | Enable EFS Support                                                                               | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [aws-for-fluent-bit](https://github.com/aws/aws-for-fluent-bit)                                                               | Cloudwatch logging with fluent bit instead of fluentd                                            | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [aws-load-balancer-controller](https://aws.amazon.com/about-aws/whats-new/2020/10/introducing-aws-load-balancer-controller/)  | Use AWS ALB/NLB for ingress and services                                                         | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [aws-node-termination-handler](https://github.com/aws/aws-node-termination-handler)                                           | Manage spot instance lifecyle                                                                    | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [aws-calico](https://github.com/aws/eks-charts/tree/master/stable/aws-calico)                                                 | Use calico for network policy                                                                    | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [cert-manager](https://github.com/jetstack/cert-manager)                                                                      | automatically generate TLS certificates, supports ACME v2                                        | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :x:                 | N/A                 |
| [cluster-autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler)                                 | scale worker nodes based on workload                                                             | N/A                 | :heavy_check_mark:  | Included            | Included            | Included            |
| [cni-metrics-helper](https://docs.aws.amazon.com/eks/latest/userguide/cni-metrics-helper.html)                                | Provides cloudwatch metrics for VPC CNI plugins                                                  | N/A                 | :heavy_check_mark:  | N/A                 | N/A                 | N/A                 |
| [external-dns](https://github.com/kubernetes-incubator/external-dns)                                                          | sync ingress and service records in route53                                                      | :x:                 | :heavy_check_mark:  | :heavy_check_mark:  | :x:                 | :x:                 |
| [flux2](https://github.com/fluxcd/flux2)                                                                                      | Open and extensible continuous delivery solution for Kubernetes. Powered by GitOps Toolkit       | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [ingress-nginx](https://github.com/kubernetes/ingress-nginx)                                                                  | processes `Ingress` object and acts as a HTTP/HTTPS proxy (compatible with cert-manager)         | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :x:                 | :x:                 |
| [istio-operator](https://istio.io)                                                                                            | Service mesh for Kubernetes                                                                      | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [k8gb](https://www.k8gb.io/)                                                                                                  | A cloud native Kubernetes Global Balancer                                                        | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [karma](https://github.com/prymitive/karma)                                                                                   | An alertmanager dashboard                                                                        | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [keycloak](https://www.keycloak.org/)                                                                                         | Identity and access management                                                                   | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [kong](https://konghq.com/kong)                                                                                               | API Gateway ingress controller                                                                   | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :x:                 | :x:                 |
| [kube-prometheus-stack](https://github.com/prometheus-operator/kube-prometheus)                                               | Monitoring / Alerting / Dashboards                                                               | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :x:                 | :x:                 |
| [kyverno](https://github.com/kyverno/kyverno)                                                                                 | Kubernetes Native Policy Management                                                              | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [loki-stack](https://grafana.com/oss/loki/)                                                                                   | Grafana Loki logging stack                                                                       | :heavy_check_mark:  | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [promtail](https://grafana.com/docs/loki/latest/clients/promtail/)                                                            | Ship log to loki from other cluster (eg. mTLS)                                                   | :construction:      | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [prometheus-adapter](https://github.com/kubernetes-sigs/prometheus-adapter)                                                   | Prometheus metrics for use with the autoscaling/v2 Horizontal Pod Autoscaler in Kubernetes 1.6+  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [prometheus-cloudwatch-exporter](https://github.com/prometheus/cloudwatch_exporter)                                           | An exporter for Amazon CloudWatch, for Prometheus.                                               | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [prometheus-blackbox-exporter](https://github.com/prometheus/blackbox_exporter)                                               | The blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP.  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [metrics-server](https://github.com/kubernetes-incubator/metrics-server)                                                      | enable metrics API and horizontal pod scaling (HPA)                                              | :heavy_check_mark:  | :heavy_check_mark:  | Included            | Included            | Included            |
| [node-problem-detector](https://github.com/kubernetes/node-problem-detector)                                                  | Forwards node problems to Kubernetes events                                                      | :heavy_check_mark:  | :heavy_check_mark:  | Included            | Included            | Included            |
| [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets)                                                              | Technology agnostic, store secrets on git                                                        | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [strimzi-kafka-operator](https://github.com/strimzi/strimzi-kafka-operator)                                                   | Apache Kafka running on Kubernetes                                                               | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |
| [thanos](https://thanos.io/)                                                                                                  | Open source, highly available Prometheus setup with long term storage capabilities               | :x:                 | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [thanos-memcached](https://thanos.io/tip/components/query-frontend.md/#memcached)                                             | Open source, highly available Prometheus setup with long term storage capabilities               | :x:                 | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [thanos-storegateway](https://thanos.io/)                                                                                     | Additional storegateway to query multiple object stores                                          | :x:                 | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [thanos-tls-querier](https://thanos.io/tip/operating/cross-cluster-tls-communication.md/)                                     | Thanos TLS querier for cross cluster collection                                                  | :x:                 | :heavy_check_mark:  | :construction:      | :x:                 | :x:                 |
| [vault](https://www.vaultproject.io/)                                                                                         | A tool for secrets management, encryption as a service, and privileged access management         | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  | :heavy_check_mark:  |

## Submodules

Submodules are used for specific cloud provider configuration such as IAM role for
AWS. For a Kubernetes vanilla cluster, generic addons should be used.

Any contribution supporting a new cloud provider is welcomed.

* [AWS](./modules/aws)
* [Scaleway](./modules/scaleway)
* [GCP](./modules/gcp)
* [Azure](./modules/azure)

## Doc generation

Code formatting and documentation for variables and outputs is generated using
[pre-commit-terraform
hooks](https://github.com/antonbabenko/pre-commit-terraform) which uses
[terraform-docs](https://github.com/segmentio/terraform-docs).

Follow [these
instructions](https://github.com/antonbabenko/pre-commit-terraform#how-to-install)
to install pre-commit locally.

And install `terraform-docs` with `go get github.com/segmentio/terraform-docs`
or `brew install terraform-docs`.

## Contributing

Report issues/questions/feature requests on in the
[issues](https://github.com/particuleio/terraform-kubernetes-addons/issues/new)
section.

Full contributing [guidelines are covered
here](https://github.com/particuleio/terraform-kubernetes-addons/blob/master/.github/CONTRIBUTING.md).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_flux"></a> [flux](#requirement\_flux) | ~> 0.1 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 4.5 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_flux"></a> [flux](#provider\_flux) | ~> 0.1 |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 4.5 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.0 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~> 1.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch_default.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository_deploy_key.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_deploy_key) | resource |
| [github_repository_file.install](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.kustomize](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.sync](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [helm_release.admiralty](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert-manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.flux](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.ingress-nginx](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio-operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.k8gb](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.karma](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.keycloak](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kong](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kube-prometheus-stack](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.kyverno](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.loki-stack](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.metrics-server](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.node-problem-detector](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus-adapter](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.prometheus-blackbox-exporter](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.sealed-secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.strimzi-kafka-operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.vault](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.apply](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.cert-manager_cluster_issuers](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.cert-manager_csi_driver](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.kong_crds](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.prometheus-operator_crds](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.sync](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.admiralty](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.cert-manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.flux](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.flux2](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.ingress-nginx](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio-operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.k8gb](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.karma](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.keycloak](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.kong](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.kube-prometheus-stack](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.kyverno](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.loki-stack](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.metrics-server](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.node-problem-detector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.prometheus-adapter](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.prometheus-blackbox-exporter](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.sealed-secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.strimzi-kafka-operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_network_policy.admiralty_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.admiralty_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.cert-manager_allow_control_plane](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.cert-manager_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.cert-manager_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.cert-manager_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.flux2_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.flux2_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.flux_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.flux_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.flux_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.ingress-nginx_allow_control_plane](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.ingress-nginx_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.ingress-nginx_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.ingress-nginx_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.ingress-nginx_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.istio-operator_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.istio-operator_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.k8gb_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.k8gb_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.karma_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.karma_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.karma_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.keycloak_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.keycloak_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.keycloak_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.keycloak_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kong_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kong_allow_monitoring](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kong_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kong_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kube-prometheus-stack_allow_control_plane](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kube-prometheus-stack_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kube-prometheus-stack_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kube-prometheus-stack_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kyverno_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.kyverno_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.loki-stack_allow_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.loki-stack_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.loki-stack_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.metrics-server_allow_control_plane](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.metrics-server_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.metrics-server_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.npd_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.npd_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.prometheus-adapter_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.prometheus-adapter_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.prometheus-blackbox-exporter_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.prometheus-blackbox-exporter_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.sealed-secrets_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.sealed-secrets_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.strimzi-kafka-operator_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.strimzi-kafka-operator_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.vault_allow_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_network_policy.vault_default_deny](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/network_policy) | resource |
| [kubernetes_priority_class.kubernetes_addons](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/priority_class) | resource |
| [kubernetes_priority_class.kubernetes_addons_ds](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/priority_class) | resource |
| [kubernetes_role.flux](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.flux](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_secret.main](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [random_string.grafana_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [time_sleep.cert-manager_sleep](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [tls_private_key.identity](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [flux_install.main](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/data-sources/install) | data source |
| [flux_sync.main](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/data-sources/sync) | data source |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/repository) | data source |
| [http_http.kong_crds](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.prometheus-operator_crds](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.prometheus-operator_version](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [kubectl_file_documents.apply](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.kong_crds](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.sync](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/file_documents) | data source |
| [kubectl_path_documents.cert-manager_cluster_issuers](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/path_documents) | data source |
| [kubectl_path_documents.cert-manager_csi_driver](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/data-sources/path_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admiralty"></a> [admiralty](#input\_admiralty) | Customize admiralty chart, see `admiralty.tf` for supported values | `any` | `{}` | no |
| <a name="input_cert-manager"></a> [cert-manager](#input\_cert-manager) | Customize cert-manager chart, see `cert-manager.tf` for supported values | `any` | `{}` | no |
| <a name="input_cluster-autoscaler"></a> [cluster-autoscaler](#input\_cluster-autoscaler) | Customize cluster-autoscaler chart, see `cluster-autoscaler.tf` for supported values | `any` | `{}` | no |
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | Name of the Kubernetes cluster | `string` | `"sample-cluster"` | no |
| <a name="input_external-dns"></a> [external-dns](#input\_external-dns) | Map of map for external-dns configuration: see `external_dns.tf` for supported values | `any` | `{}` | no |
| <a name="input_flux"></a> [flux](#input\_flux) | Customize Flux chart, see `flux.tf` for supported values | `any` | `{}` | no |
| <a name="input_flux2"></a> [flux2](#input\_flux2) | Customize Flux chart, see `flux2.tf` for supported values | `any` | `{}` | no |
| <a name="input_helm_defaults"></a> [helm\_defaults](#input\_helm\_defaults) | Customize default Helm behavior | `any` | `{}` | no |
| <a name="input_ingress-nginx"></a> [ingress-nginx](#input\_ingress-nginx) | Customize ingress-nginx chart, see `nginx-ingress.tf` for supported values | `any` | `{}` | no |
| <a name="input_istio-operator"></a> [istio-operator](#input\_istio-operator) | Customize istio operator deployment, see `istio_operator.tf` for supported values | `any` | `{}` | no |
| <a name="input_k8gb"></a> [k8gb](#input\_k8gb) | Customize k8gb chart, see `k8gb.tf` for supported values | `any` | `{}` | no |
| <a name="input_karma"></a> [karma](#input\_karma) | Customize karma chart, see `karma.tf` for supported values | `any` | `{}` | no |
| <a name="input_keycloak"></a> [keycloak](#input\_keycloak) | Customize keycloak chart, see `keycloak.tf` for supported values | `any` | `{}` | no |
| <a name="input_kong"></a> [kong](#input\_kong) | Customize kong-ingress chart, see `kong.tf` for supported values | `any` | `{}` | no |
| <a name="input_kube-prometheus-stack"></a> [kube-prometheus-stack](#input\_kube-prometheus-stack) | Customize kube-prometheus-stack chart, see `kube-prometheus-stack.tf` for supported values | `any` | `{}` | no |
| <a name="input_kyverno"></a> [kyverno](#input\_kyverno) | Customize kyverno chart, see `kyverno.tf` for supported values | `any` | `{}` | no |
| <a name="input_labels_prefix"></a> [labels\_prefix](#input\_labels\_prefix) | Custom label prefix used for network policy namespace matching | `string` | `"particule.io"` | no |
| <a name="input_loki-stack"></a> [loki-stack](#input\_loki-stack) | Customize loki-stack chart, see `loki-stack.tf` for supported values | `any` | `{}` | no |
| <a name="input_metrics-server"></a> [metrics-server](#input\_metrics-server) | Customize metrics-server chart, see `metrics_server.tf` for supported values | `any` | `{}` | no |
| <a name="input_npd"></a> [npd](#input\_npd) | Customize node-problem-detector chart, see `npd.tf` for supported values | `any` | `{}` | no |
| <a name="input_priority-class"></a> [priority-class](#input\_priority-class) | Customize a priority class for addons | `any` | `{}` | no |
| <a name="input_priority-class-ds"></a> [priority-class-ds](#input\_priority-class-ds) | Customize a priority class for addons daemonsets | `any` | `{}` | no |
| <a name="input_prometheus-adapter"></a> [prometheus-adapter](#input\_prometheus-adapter) | Customize prometheus-adapter chart, see `prometheus-adapter.tf` for supported values | `any` | `{}` | no |
| <a name="input_prometheus-blackbox-exporter"></a> [prometheus-blackbox-exporter](#input\_prometheus-blackbox-exporter) | Customize prometheus-blackbox-exporter chart, see `prometheus-blackbox-exporter.tf` for supported values | `any` | `{}` | no |
| <a name="input_promtail"></a> [promtail](#input\_promtail) | Customize promtail chart, see `loki-stack.tf` for supported values | `any` | `{}` | no |
| <a name="input_sealed-secrets"></a> [sealed-secrets](#input\_sealed-secrets) | Customize sealed-secrets chart, see `sealed-secrets.tf` for supported values | `any` | `{}` | no |
| <a name="input_strimzi-kafka-operator"></a> [strimzi-kafka-operator](#input\_strimzi-kafka-operator) | Customize strimzi-kafka-operator chart, see `strimzi-kafka-operator.tf` for supported values | `any` | `{}` | no |
| <a name="input_thanos"></a> [thanos](#input\_thanos) | Customize thanos chart, see `thanos.tf` for supported values | `any` | `{}` | no |
| <a name="input_thanos-memcached"></a> [thanos-memcached](#input\_thanos-memcached) | Customize thanos chart, see `thanos.tf` for supported values | `any` | `{}` | no |
| <a name="input_thanos-storegateway"></a> [thanos-storegateway](#input\_thanos-storegateway) | Customize thanos chart, see `thanos.tf` for supported values | `any` | `{}` | no |
| <a name="input_thanos-tls-querier"></a> [thanos-tls-querier](#input\_thanos-tls-querier) | Customize thanos chart, see `thanos.tf` for supported values | `any` | `{}` | no |
| <a name="input_vault"></a> [vault](#input\_vault) | Customize Hashicorp Vault chart, see `vault.tf` for supported values | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_password"></a> [grafana\_password](#output\_grafana\_password) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
