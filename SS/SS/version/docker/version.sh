# --------------------------------------------------
# 🔗 NETWORK
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_NGINX="1.27.0"                              # https://hub.docker.com/_/nginx/tags
export TF_VAR_VERSION_DOCKER_NPM="github-pr-3792"                        # https://hub.docker.com/r/jc21/nginx-proxy-manager/tags
export TF_VAR_VERSION_DOCKER_METALLB="0.14.5"                            # https://artifacthub.io/packages/helm/metallb/metallb
export TF_VAR_VERSION_DOCKER_TRAEFIK="3.0.2"                             # https://hub.docker.com/_/traefik/tags
export TF_VAR_VERSION_DOCKER_PAPERCUT="20180425042132"                   # https://hub.docker.com/r/jijiechen/papercut/tags

# --------------------------------------------------
# 💾 DATABASES
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_CASSANDRA="5.0"                             # https://hub.docker.com/_/cassandra/tags
export TF_VAR_VERSION_DOCKER_CASSANDRA_WEB="1.1.4"                       # https://hub.docker.com/r/ipushc/cassandra-web/tags
export TF_VAR_VERSION_DOCKER_POSTGRES="16.3"                             # https://hub.docker.com/_/postgres/tags
export TF_VAR_VERSION_DOCKER_MYSQL="8.3.0"                               # https://hub.docker.com/_/mysql/tags
export TF_VAR_VERSION_DOCKER_MARIADB="11.4.2"                            # https://hub.docker.com/_/mariadb/tags
export TF_VAR_VERSION_DOCKER_MONGODB="7.0.11"                            # https://hub.docker.com/_/mongo/tags
export TF_VAR_VERSION_DOCKER_MONGODB_EXPRESS="1.0.2-20"                  # https://hub.docker.com/_/mongo-express/tags
export TF_VAR_VERSION_DOCKER_REDIS="7.2.5"                               # https://hub.docker.com/_/redis/tags
export TF_VAR_VERSION_DOCKER_REDISCOMMANDER="0.8.1"                      # https://github.com/joeferner/redis-commander/tags
export TF_VAR_VERSION_DOCKER_MEMCACHED="1.6.28"                          # https://hub.docker.com/_/memcached/tags
export TF_VAR_VERSION_DOCKER_PROMETHEUS="2.51.2"                         # https://hub.docker.com/r/prom/prometheus/tags
export TF_VAR_VERSION_DOCKER_ELASTICSEARCH="8.13.0"                      # https://hub.docker.com/_/elasticsearch/tags
export TF_VAR_VERSION_DOCKER_KIBANA=$TF_VAR_VERSION_DOCKER_ELASTICSEARCH # https://hub.docker.com/_/kibana/tags
export TF_VAR_VERSION_DOCKER_GRAFANA="10.4.2"                            # https://hub.docker.com/r/grafana/grafana/tags
export TF_VAR_VERSION_DOCKER_PGADMIN="8.8"                               # https://hub.docker.com/r/dpage/pgadmin4/tags
export TF_VAR_VERSION_DOCKER_PHPMYADMIN="5.2.1"                          # https://hub.docker.com/_/phpmyadmin/tags

# --------------------------------------------------
# 🔐 SECURITY
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_VAULT="1.13.3"                              # https://hub.docker.com/_/vault/tags
export TF_VAR_VERSION_DOCKER_VAULTWARDEN="1.30.5"                        # https://hub.docker.com/r/vaultwarden/server/tags
export TF_VAR_VERSION_DOCKER_KEYCLOAK="25.0.0"                           # https://hub.docker.com/r/keycloak/keycloak/tags
export TF_VAR_VERSION_DOCKER_TWINGATE="1.67.0"                           # https://hub.docker.com/r/twingate/connector/tags
export TF_VAR_VERSION_DOCKER_GUACD="1.5.5"                               # https://hub.docker.com/r/guacamole/guacd/tags
export TF_VAR_VERSION_DOCKER_GUACAMOLE=$TF_VAR_VERSION_DOCKER_GUACD      # https://hub.docker.com/r/guacamole/guacamole/tags
export TF_VAR_VERSION_DOCKER_PIHOLE="2024.05.0"                          # https://hub.docker.com/r/pihole/pihole/tags

# --------------------------------------------------
# 🛠️ TOOLS
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_FILEBROWSER="2.30.0"                        # https://hub.docker.com/r/filebrowser/filebrowser/tags
export TF_VAR_VERSION_DOCKER_KUTT="2.7.4"                                # https://hub.docker.com/r/kutt/kutt/tags
export TF_VAR_VERSION_DOCKER_SEARXNG="2024.6.14-7be468d21"               # https://hub.docker.com/r/searxng/searxng/tags
export TF_VAR_VERSION_DOCKER_DASHY="3.1.0"                               # https://hub.docker.com/r/lissy93/dashy/tags
export TF_VAR_VERSION_DOCKER_UPTIMEKUMA="1.23.13"                        # https://hub.docker.com/r/louislam/uptime-kuma/tags
export TF_VAR_VERSION_DOCKER_LISTMONK="3.0.0"                            # https://hub.docker.com/r/listmonk/listmonk/tags
export TF_VAR_VERSION_DOCKER_FREESCOUT="8.3-1.17.67"                     # https://hub.docker.com/r/tiredofit/freescout/tags
export TF_VAR_VERSION_DOCKER_RUSTDESK="1.1.11"                           # https://hub.docker.com/r/rustdesk/rustdesk-server/tags
export TF_VAR_VERSION_DOCKER_STIRLINGPDF="0.26.0"                        # https://hub.docker.com/r/frooodle/s-pdf/tags
export TF_VAR_VERSION_DOCKER_JELLYFIN="10.9.6"                           # https://hub.docker.com/r/jellyfin/jellyfin/tags

# --------------------------------------------------
# 💻 DEVELOPMENT
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_RABBITMQ="3.13.3-management"                # https://hub.docker.com/_/rabbitmq/tags
export TF_VAR_VERSION_DOCKER_HARBOR="2.11.0"                             # https://hub.docker.com/r/bitnami/harbor-registry/tags 
export TF_VAR_VERSION_DOCKER_GITLAB="16.11.4-ce.0"                       # https://hub.docker.com/r/gitlab/gitlab-ce/tags
export TF_VAR_VERSION_DOCKER_CODESERVER="4.90.1"                         # https://hub.docker.com/r/linuxserver/code-server/tags
export TF_VAR_VERSION_DOCKER_JENKINS="2.454"                             # https://hub.docker.com/r/jenkins/jenkins/tags

# --------------------------------------------------
# 🥷 HACK
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_PHONEINFOGA="2.11.0"                        # https://hub.docker.com/r/sundowndev/phoneinfoga/tags
export TF_VAR_VERSION_DOCKER_SOFTETHER="4.42-9798-rtm-2023.06.30"        # https://www.softether-download.com/files/softether
export TF_VAR_VERSION_DOCKER_BEEF="0.5.4.0"                              # https://github.com/beefproject/beef/releases

# --------------------------------------------------
# 📀 OPERATING SYSTEM
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_UBUNTU="24.04"                              # https://hub.docker.com/_/ubuntu/tags
export TF_VAR_VERSION_DOCKER_KALI="latest"                               # https://hub.docker.com/r/kalilinux/kali-rolling/tags
export TF_VAR_VERSION_DOCKER_RUBY="3.3.3"                                # https://hub.docker.com/_/ruby/tags
export TF_VAR_VERSION_DOCKER_PYTHON="3.12.3"                             # https://hub.docker.com/_/python/tags
export TF_VAR_VERSION_DOCKER_PUTER="2.3.0"                               # https://github.com/HeyPuter/puter/tags

# --------------------------------------------------
# 🤖 AI
# --------------------------------------------------
export TF_VAR_VERSION_DOCKER_OLLAMA="0.1.44"                             # https://hub.docker.com/r/ollama/ollama/tags
