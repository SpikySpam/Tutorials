resource "docker_image" "jenkins" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DEVELOPMENT.JENKINS_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_JENKINS}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DEVELOPMENT.JENKINS_NAME}"
    dockerfile = "dockerfile"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_JENKINS}"
    }
  }
}

resource "docker_container" "jenkins" {
  count   = 0
  image   = docker_image.jenkins[0].image_id
  name    = "${var.vars.SECRETS.DEVELOPMENT.JENKINS_NAME}"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DEVELOPMENT.JENKINS_PORT_INT
    external = var.vars.PORTS.DEVELOPMENT.JENKINS_PORT_EXT
  }
  # ports {
  #   internal = var.vars.PORTS.DEVELOPMENT.JENKINS_PORT_INT_50000
  #   external = var.vars.PORTS.DEVELOPMENT.JENKINS_PORT_EXT_50000
  # }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.JENKINS_NAME}"
    container_path = "/var/jenkins_home"
  }
  volumes {
    host_path = "${var.vars.PATHS.PATH_HOME}/docker/${var.vars.SECRETS.DEVELOPMENT.JENKINS_NAME}/docker.sock"
    container_path = "/var/run/docker.sock"
  }
  env = [
    "JAVA_OPTS=-Djenkins.install.runSetupWizard=false",
    "JENKINS_OPTS=--argumentsRealm.roles.user=${var.vars.SECRETS.DEVELOPMENT.JENKINS_USER} --argumentsRealm.passwd.admin=${var.vars.SECRETS.DEVELOPMENT.JENKINS_PASSWORD} --argumentsRealm.roles.admin=admin",
  ]
  privileged = true
  user = "root"
}
