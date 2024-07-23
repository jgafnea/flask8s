resource "kubernetes_namespace" "jok8s-namespace" {
  metadata {
    name = "jok8s-ns"
  }
}

resource "kubernetes_deployment" "jok8s-deployment" {
  metadata {
    name      = "jok8s-deployment"
    namespace = "jok8s-ns"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "jok8s"
      }
    }

    template {
      metadata {
        labels = {
          app = "jok8s"
        }
      }

      spec {
        container {
          image = "jgafnea/jok8s:1.0"
          name  = "jok8s-container"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "jok8s-service" {
  metadata {
    name      = "jok8s-service"
    namespace = "jok8s-ns"
  }
  spec {
    selector = kubernetes_deployment.jok8s-deployment.spec.0.template.0.metadata.0.labels
    port {
      port        = 5000
      target_port = 5000
      node_port   = 32000
    }
    type = "NodePort"
  }
}
