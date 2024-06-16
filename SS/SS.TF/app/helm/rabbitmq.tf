resource "helm_release" "rabbitmq" {
  count            = var.current.rabbitmq.helm.enabled ? 1 : 0
  name             = "${var.current.rabbitmq.name}"
  namespace        = "${var.current.rabbitmq.name}"
  repository       = "${var.current.rabbitmq.helm.repository}"
  chart            = "${var.current.rabbitmq.helm.chart}"
  version          = "${var.current.rabbitmq.helm.version}"
  create_namespace = true
  wait             = false
  cleanup_on_fail  = true
  timeout          = 600
  values           = [jsonencode({
    image = {
      tag = var.current.rabbitmq.docker.version
    }
    persistence = {
      enabled = false
    }
    ingress = {
      enabled = true
      hostname = "${var.current.rabbitmq.name}.${var.vars.HOST}"
    }
  })]
}
