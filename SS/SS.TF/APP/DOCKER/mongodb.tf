resource "docker_network" "mongodb" {
  count  = 0
  name   = "${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
  driver = "bridge"
}

# MONGODB
resource "docker_image" "mongodb" {
  count = 0
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.MONGODB_NAME}:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
    dockerfile = "dockerfile-mongodb"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB}"
    }
  }
}

resource "docker_container" "mongodb" {
  count   = 0
  image   = docker_image.mongodb[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
  restart = "unless-stopped"
  env = [
    "MONGO_INITDB_ROOT_USERNAME=${var.VARS.SECRETS.DATABASES.MONGODB_USER}",
    "MONGO_INITDB_ROOT_PASSWORD=${var.VARS.SECRETS.DATABASES.MONGODB_PASSWORD}",
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
    name = "${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
  }
}

# MONGODB-EXPRESS
resource "docker_image" "mongodb-express" {
  count = 0
  depends_on = [ docker_container.mongodb ]
  name  = "${var.VARS.DOMAIN}/${var.VARS.SECRETS.DATABASES.MONGODB_NAME}-express:${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB_EXPRESS}"
  build {
    context    = "${var.VARS.PATHS.PATH_APP}/docker/${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
    dockerfile = "dockerfile-mongodb-express"
    build_args = {
      VERSION = "${var.VARS.VERSIONS.DOCKER.VERSION_DOCKER_MONGODB_EXPRESS}"
    }
  }
}

resource "docker_container" "mongodb-express" {
  count   = 0
  image   = docker_image.mongodb-express[0].image_id
  name    = "${var.VARS.SECRETS.DATABASES.MONGODB_NAME}-express"
  restart = "unless-stopped"
  ports {
    internal = var.VARS.PORTS.DATABASES.MONGODB_PORT_INT
    external = var.VARS.PORTS.DATABASES.MONGODB_PORT_EXT
  }
  env = [
    "ME_CONFIG_MONGODB_ADMINUSERNAME=${var.VARS.SECRETS.DATABASES.MONGODB_USER}",
    "ME_CONFIG_MONGODB_ADMINPASSWORD=${var.VARS.SECRETS.DATABASES.MONGODB_PASSWORD}",
    "ME_CONFIG_MONGODB_URL=${var.VARS.SECRETS.DATABASES.MONGODB_NAME}://${var.VARS.SECRETS.DATABASES.MONGODB_USER}:${var.VARS.SECRETS.DATABASES.MONGODB_PASSWORD}@${var.VARS.SECRETS.DATABASES.MONGODB_NAME}:27017/",
    "ME_CONFIG_BASICAUTH=true",
    "ME_CONFIG_BASICAUTH_USERNAME=${var.VARS.SECRETS.DATABASES.MONGODB_USER}",
    "ME_CONFIG_BASICAUTH_PASSWORD=${var.VARS.SECRETS.DATABASES.MONGODB_PASSWORD}",
  ]
  networks_advanced {
    name = "${var.VARS.SECRETS.DATABASES.MONGODB_NAME}"
  }
}
