export TF_VAR_VERSION_DOCKER_NGINX="1.25.2"                              # https://hub.docker.com/_/nginx/tags
export TF_VAR_VERSION_DOCKER_NPM="github-pr-3199"                        # https://hub.docker.com/r/jc21/nginx-proxy-manager/tags

# --------------------------------------------------
# 💾 DATABASES
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_POSTGRES="16.0"                             # https://hub.docker.com/_/postgres/tags
export TF_VAR_VERSION_DOCKER_MYSQL="8.1.0"                               # https://hub.docker.com/_/mysql/tags
export TF_VAR_VERSION_DOCKER_MARIADB="11.1.2"                            # https://hub.docker.com/_/mariadb/tags
export TF_VAR_VERSION_DOCKER_REDIS="7.2.1"                               # https://hub.docker.com/_/redis/tags
export TF_VAR_VERSION_DOCKER_PROMETHEUS="2.47.0"                         # https://hub.docker.com/r/prom/prometheus/tags
export TF_VAR_VERSION_DOCKER_ELASTICSEARCH="8.10.2"                      # https://hub.docker.com/_/elasticsearch/tags
export TF_VAR_VERSION_DOCKER_KIBANA=$TF_VAR_VERSION_DOCKER_ELASTICSEARCH # https://hub.docker.com/_/kibana/tags
export TF_VAR_VERSION_DOCKER_GRAFANA="10.1.2"                            # https://hub.docker.com/r/grafana/grafana/tags
export TF_VAR_VERSION_DOCKER_PGADMIN="7.7"                               # https://hub.docker.com/r/dpage/pgadmin4/tags
export TF_VAR_VERSION_DOCKER_PHPMYADMIN="5.2.1"                          # https://hub.docker.com/_/phpmyadmin/tags

# --------------------------------------------------
# 🔐 SECURITY
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_VAULT="1.13.3"                              # https://hub.docker.com/_/vault/tags
export TF_VAR_VERSION_DOCKER_VAULTWARDEN="1.29.2"                        # https://hub.docker.com/r/vaultwarden/server/tags
export TF_VAR_VERSION_DOCKER_KEYCLOAK="22.0.3"                           # https://hub.docker.com/r/keycloak/keycloak/tags
export TF_VAR_VERSION_DOCKER_TWINGATE="1.59.0"                           # https://hub.docker.com/r/twingate/connector/tags
export TF_VAR_VERSION_DOCKER_GUACD="1.5.3"                               # https://hub.docker.com/r/guacamole/guacd/tags
export TF_VAR_VERSION_DOCKER_GUACAMOLE=$TF_VAR_VERSION_DOCKER_GUACD      # https://hub.docker.com/r/guacamole/guacamole/tags

# --------------------------------------------------
# 🛠️ TOOLS
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_FILEBROWSER="2.25.0"                        # https://hub.docker.com/r/filebrowser/filebrowser/tags
export TF_VAR_VERSION_DOCKER_KUTT="2.7.4"                                # https://hub.docker.com/r/kutt/kutt/tags
export TF_VAR_VERSION_DOCKER_SEARXNG="2023.9.24-19383921d"               # https://hub.docker.com/r/searxng/searxng/tags
export TF_VAR_VERSION_DOCKER_DASHY="2.1.1"                               # https://hub.docker.com/r/lissy93/dashy/tags
export TF_VAR_VERSION_DOCKER_UPTIMEKUMA="1.23.2"                         # https://hub.docker.com/r/louislam/uptime-kuma/tags
export TF_VAR_VERSION_DOCKER_LISTMONK="2.5.1"                            # https://hub.docker.com/r/listmonk/listmonk/tags
export TF_VAR_VERSION_DOCKER_FREESCOUT="8.2-1.17.42"                     # https://hub.docker.com/r/tiredofit/freescout/tags
export TF_VAR_VERSION_DOCKER_RUSTDESK="1.1.8-2"                          # https://hub.docker.com/r/rustdesk/rustdesk-server/tags

# --------------------------------------------------
# 💻 DEVELOPMENT
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_RABBITMQ="3.12.6-management"                # https://hub.docker.com/_/rabbitmq/tags
export TF_VAR_VERSION_DOCKER_HARBOR="2.9.0"                              # https://hub.docker.com/r/bitnami/harbor-registry/tags 
export TF_VAR_VERSION_DOCKER_GITLAB="16.4.0-ce.0"                        # https://hub.docker.com/r/gitlab/gitlab-ce/tags
export TF_VAR_VERSION_DOCKER_CODESERVER="4.17.0"                         # https://hub.docker.com/r/linuxserver/code-server/tags
export TF_VAR_VERSION_DOCKER_JENKINS="2.425"                             # https://hub.docker.com/r/jenkins/jenkins/tags

# --------------------------------------------------
# 🥷 HACK
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_PHONEINFOGA="2.10.7"                        # https://hub.docker.com/r/sundowndev/phoneinfoga/tags
export TF_VAR_VERSION_DOCKER_SOFTETHER="4.42-9798-rtm-2023.06.30"        # https://www.softether-download.com/files/softether
export TF_VAR_VERSION_DOCKER_BEEF="0.5.4.0"                              # https://github.com/beefproject/beef/releases

# --------------------------------------------------
# 📀 OPERATING SYSTEM
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_UBUNTU="23.04"                              # https://hub.docker.com/_/ubuntu/tags
export TF_VAR_VERSION_DOCKER_KALI="latest"                               # https://hub.docker.com/r/kalilinux/kali-rolling/tags
export TF_VAR_VERSION_DOCKER_RUBY="3.2.2"                                # https://hub.docker.com/_/ruby/tags
export TF_VAR_VERSION_DOCKER_PYTHON="3.9.18"                             # https://hub.docker.com/_/python/tags
export TF_VAR_VERSION_DOCKER_PUTER="2.1.0"                               # https://github.com/HeyPuter/puter/tags

export TF_VAR_VERSION_DOCKER_OLLAMA="0.1.31"                             # https://hub.docker.com/r/ollama/ollama/tags
