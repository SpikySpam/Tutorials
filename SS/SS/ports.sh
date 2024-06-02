# --------------------------------------------------
# 🔗 NETWORK
# --------------------------------------------------
export TF_VAR_NGINX_PORT_INT=80
export TF_VAR_NGINX_PORT_EXT=9100
export TF_VAR_PAPERCUT_GUI_PORT_INT=37408
export TF_VAR_PAPERCUT_GUI_PORT_EXT=37408
export TF_VAR_PAPERCUT_SMTP_PORT_INT=25
export TF_VAR_PAPERCUT_SMTP_PORT_EXT=37425

# --------------------------------------------------
# 💾 DATABASES
# --------------------------------------------------
export TF_VAR_CASSANDRA_PORT_INT=9042
export TF_VAR_CASSANDRA_PORT_EXT=9042
export TF_VAR_CASSANDRA_WEB_PORT_INT=80
export TF_VAR_CASSANDRA_WEB_PORT_EXT=8092
export TF_VAR_POSTGRES_PORT_INT=5432
export TF_VAR_POSTGRES_PORT_EXT=5432
export TF_VAR_MYSQL_PORT_INT=3306
export TF_VAR_MYSQL_PORT_EXT=3306
export TF_VAR_MARIADB_PORT_INT=3306
export TF_VAR_MARIADB_PORT_EXT=3366
export TF_VAR_MONGODB_PORT_INT=8081
export TF_VAR_MONGODB_PORT_EXT=8091
export TF_VAR_REDIS_PORT_INT=6379
export TF_VAR_REDIS_PORT_EXT=6379
export TF_VAR_REDISCOMMANDER_PORT_INT=8081
export TF_VAR_REDISCOMMANDER_PORT_EXT=8079
export TF_VAR_MEMCACHED_PORT_INT=11211
export TF_VAR_PROMETHEUS_PORT_INT=9090
export TF_VAR_PROMETHEUS_PORT_EXT=9090
export TF_VAR_ELASTICSEARCH_PORT_INT=9200
export TF_VAR_ELASTICSEARCH_PORT_EXT=9200
export TF_VAR_KIBANA_PORT_INT=5601
export TF_VAR_KIBANA_PORT_EXT=5601
export TF_VAR_GRAFANA_PORT_INT=3000
export TF_VAR_GRAFANA_PORT_EXT=3002
export TF_VAR_PGADMIN_PORT_INT=80
export TF_VAR_PGADMIN_PORT_EXT=5433
export TF_VAR_PHPMYADMIN_PORT_INT=80
export TF_VAR_PHPMYADMIN_PORT_EXT=3307

# --------------------------------------------------
# 🔐 SECURITY
# --------------------------------------------------
export TF_VAR_VAULT_PORT_INT=8201
export TF_VAR_VAULT_PORT_EXT=8201
export TF_VAR_VAULTWARDEN_PORT_INT=80
export TF_VAR_VAULTWARDEN_PORT_EXT=7000
export TF_VAR_KEYCLOAK_PORT_INT=8080
export TF_VAR_KEYCLOAK_PORT_EXT=8081
export TF_VAR_GUACD_PORT_INT=4822
export TF_VAR_GUACD_PORT_EXT=4822
export TF_VAR_GUACAMOLE_PORT_INT=8080
export TF_VAR_GUACAMOLE_PORT_EXT=8080
export TF_VAR_PIHOLE_PORT_INT_53=53
export TF_VAR_PIHOLE_PORT_EXT_53=5300
export TF_VAR_PIHOLE_PORT_INT_67=67
export TF_VAR_PIHOLE_PORT_EXT_67=6700
export TF_VAR_PIHOLE_PORT_INT_80=80
export TF_VAR_PIHOLE_PORT_EXT_80=8084
export TF_VAR_TRAEFIK_PORT_INT_80=80
export TF_VAR_TRAEFIK_PORT_EXT_80=8085
export TF_VAR_TRAEFIK_PORT_INT_443=443
export TF_VAR_TRAEFIK_PORT_EXT_443=4437
export TF_VAR_TRAEFIK_PORT_INT_8080=8080
export TF_VAR_TRAEFIK_PORT_EXT_8080=8089

# --------------------------------------------------
# 🛠️ TOOLS
# --------------------------------------------------
export TF_VAR_FILEBROWSER_PORT_INT=80
export TF_VAR_FILEBROWSER_PORT_EXT=8083
export TF_VAR_KUTT_PORT_INT=3000
export TF_VAR_KUTT_PORT_EXT=3000
export TF_VAR_SEARXNG_PORT_INT=8080
export TF_VAR_SEARXNG_PORT_EXT=8082
export TF_VAR_DASHY_PORT_INT=80
export TF_VAR_DASHY_PORT_EXT=8087
export TF_VAR_UPTIMEKUMA_PORT_INT=3001
export TF_VAR_UPTIMEKUMA_PORT_EXT=3001
export TF_VAR_LISTMONK_PORT_INT=9000
export TF_VAR_LISTMONK_PORT_EXT=9000
export TF_VAR_FREESCOUT_PORT_INT=80
export TF_VAR_FREESCOUT_PORT_EXT=8088
export TF_VAR_ZAMMAD_PORT_INT=8080
export TF_VAR_ZAMMAD_PORT_EXT=8280
export TF_VAR_RUSTDESK_SIGNAL_PORT_INT_21114=21114
export TF_VAR_RUSTDESK_SIGNAL_PORT_EXT_21114=21114
export TF_VAR_RUSTDESK_SIGNAL_PORT_INT_21115=21115
export TF_VAR_RUSTDESK_SIGNAL_PORT_EXT_21115=21115
export TF_VAR_RUSTDESK_SIGNAL_PORT_INT_21116=21116
export TF_VAR_RUSTDESK_SIGNAL_PORT_EXT_21116=21116
export TF_VAR_RUSTDESK_SIGNAL_PORT_INT_21118=21118
export TF_VAR_RUSTDESK_SIGNAL_PORT_EXT_21118=21118
export TF_VAR_RUSTDESK_RELAY_PORT_INT_21117=21117
export TF_VAR_RUSTDESK_RELAY_PORT_EXT_21117=21117
export TF_VAR_RUSTDESK_RELAY_PORT_INT_21119=21119
export TF_VAR_RUSTDESK_RELAY_PORT_EXT_21119=21119
export TF_VAR_STIRLINGPDF_PORT_INT=8080
export TF_VAR_STIRLINGPDF_PORT_EXT=8095
export TF_VAR_JELLYFIN_PORT_INT=8096
export TF_VAR_JELLYFIN_PORT_EXT=8096

# --------------------------------------------------
# 💻 DEVELOPMENT
# --------------------------------------------------
export TF_VAR_RABBITMQ_PORT_INT_NODE=5672
export TF_VAR_RABBITMQ_PORT_EXT_NODE=5672
export TF_VAR_RABBITMQ_PORT_INT_DIST=15672
export TF_VAR_RABBITMQ_PORT_EXT_DIST=15672
export TF_VAR_HARBOR_PORT_INT=8080
export TF_VAR_HARBOR_PORT_EXT=8085
export TF_VAR_HARBOR_PORT_INT_REGISTRY=5000
export TF_VAR_HARBOR_PORT_EXT_REGISTRY=5000 
export TF_VAR_GITLAB_PORT_INT_80=80
export TF_VAR_GITLAB_PORT_EXT_80=8086
export TF_VAR_GITLAB_PORT_INT_443=443
export TF_VAR_GITLAB_PORT_EXT_443=4436
export TF_VAR_GITLAB_PORT_INT_22=22
export TF_VAR_GITLAB_PORT_EXT_22=5022
export TF_VAR_CODESERVER_PORT_INT=8443
export TF_VAR_CODESERVER_PORT_EXT=8445
export TF_VAR_JENKINS_PORT_INT=8080
export TF_VAR_JENKINS_PORT_EXT=8180
export TF_VAR_JENKINS_PORT_INT_50000=50000
export TF_VAR_JENKINS_PORT_EXT_50000=50000

# --------------------------------------------------
# 📀 OPERATING SYSTEM
# --------------------------------------------------
export TF_VAR_PUTER_PORT_INT=4100
export TF_VAR_PUTER_PORT_EXT=4100

# --------------------------------------------------
# 🥷 HACK
# --------------------------------------------------
export TF_VAR_PHONEINFOGA_PORT_INT=5000
export TF_VAR_PHONEINFOGA_PORT_EXT=5001
export TF_VAR_STORMBREAKER_PORT_INT=80
export TF_VAR_STORMBREAKER_PORT_EXT=2525
export TF_VAR_SOFTETHER_PORT_INT_443=443
export TF_VAR_SOFTETHER_PORT_EXT_443=8443
export TF_VAR_SOFTETHER_PORT_INT_5555=5555
export TF_VAR_SOFTETHER_PORT_EXT_5555=5555
export TF_VAR_SOFTETHER_PORT_INT_992=992
export TF_VAR_SOFTETHER_PORT_EXT_992=8992
export TF_VAR_SOFTETHER_PORT_INT_500=500
export TF_VAR_SOFTETHER_PORT_EXT_500=8500
export TF_VAR_SOFTETHER_PORT_INT_4500=4500
export TF_VAR_SOFTETHER_PORT_EXT_4500=4500
export TF_VAR_SOFTETHER_PORT_INT_1701=1701
export TF_VAR_SOFTETHER_PORT_EXT_1701=1701
export TF_VAR_SOFTETHER_PORT_INT_1194=1194
export TF_VAR_SOFTETHER_PORT_EXT_1194=1194
export TF_VAR_BEEF_PORT_INT_3000=3000
export TF_VAR_BEEF_PORT_EXT_3000=3003
export TF_VAR_BEEF_PORT_INT_6789=6789
export TF_VAR_BEEF_PORT_EXT_6789=6789
export TF_VAR_BEEF_PORT_INT_61985=61985
export TF_VAR_BEEF_PORT_EXT_61985=61985
export TF_VAR_BEEF_PORT_INT_61986=61986
export TF_VAR_BEEF_PORT_EXT_61986=61986

# --------------------------------------------------
# 🤖 AI
# --------------------------------------------------
export TF_VAR_CHATGPT_PORT_INT=8001
export TF_VAR_CHATGPT_PORT_EXT=8001

# --------------------------------------------------
# 🚀 OWN APPS
# --------------------------------------------------
export TF_VAR_CHECKMAIL_BACK_PORT_80_INT=45801
export TF_VAR_CHECKMAIL_BACK_PORT_80_EXT=45801
export TF_VAR_CHECKMAIL_BACK_PORT_443_INT=45431
export TF_VAR_CHECKMAIL_BACK_PORT_443_EXT=45431