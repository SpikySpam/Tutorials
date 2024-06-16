resource "docker_network" "mongodb" {
  count  = 0
  name   = "${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
  driver = "bridge"
}

# MONGODB
resource "docker_image" "mongodb" {
  count = 0
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.MONGODB_NAME}:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
    dockerfile = "dockerfile-mongodb"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB}"
    }
  }
}

resource "docker_container" "mongodb" {
  count   = 0
  image   = docker_image.mongodb[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
  restart = "unless-stopped"
  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.vars.SECRETS.DATABASES.MONGODB_USER}",
    "MONGO_INITDB_ROOT_PASSWORD=${var.vars.SECRETS.DATABASES.MONGODB_PASSWORD}",
  ]
  healthcheck {
    test     = ["CMD","mongosh", "--eval", "db.adminCommand('ping')"]
    interval = "10s"
    timeout  = "5s"
    retries  = 5
  }
  wait = true
  wait_timeout = 60
  networks_advanced {
    name = "${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
  }
}

# MONGODB-EXPRESS
resource "docker_image" "mongodb-express" {
  count = 0
  depends_on = [ docker_container.mongodb ]
  name  = "${var.vars.DOMAIN}/${var.vars.SECRETS.DATABASES.MONGODB_NAME}-express:${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB_EXPRESS}"
  build {
    context    = "${var.vars.PATHS.PATH_APP}/docker/${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
    dockerfile = "dockerfile-mongodb-express"
    build_args = {
      VERSION = "${var.vars.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB_EXPRESS}"
    }
  }
}

resource "docker_container" "mongodb-express" {
  count   = 0
  image   = docker_image.mongodb-express[0].image_id
  name    = "${var.vars.SECRETS.DATABASES.MONGODB_NAME}-express"
  restart = "unless-stopped"
  ports {
    internal = var.vars.PORTS.DATABASES.MONGODB_PORT_INT
    external = var.vars.PORTS.DATABASES.MONGODB_PORT_EXT
  }
  env = [
    "ME_CONFIG_MONGODB_ADMINUSERNAME=${var.vars.SECRETS.DATABASES.MONGODB_USER}",
    "ME_CONFIG_MONGODB_ADMINPASSWORD=${var.vars.SECRETS.DATABASES.MONGODB_PASSWORD}",
    "ME_CONFIG_MONGODB_URL=${var.vars.SECRETS.DATABASES.MONGODB_NAME}://${var.vars.SECRETS.DATABASES.MONGODB_USER}:${var.vars.SECRETS.DATABASES.MONGODB_PASSWORD}@${var.vars.SECRETS.DATABASES.MONGODB_NAME}:27017/",
    "ME_CONFIG_BASICAUTH=true",
    "ME_CONFIG_BASICAUTH_USERNAME=${var.vars.SECRETS.DATABASES.MONGODB_USER}",
    "ME_CONFIG_BASICAUTH_PASSWORD=${var.vars.SECRETS.DATABASES.MONGODB_PASSWORD}",
  ]
  networks_advanced {
    name = "${var.vars.SECRETS.DATABASES.MONGODB_NAME}"
  }
}
