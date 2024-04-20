#!/bin/bash

# 🌍 DOMAIN
export TF_VAR_DOMAIN="example.com"

# 🔏 JWT
export TF_VAR_JWT_ISSUER="https://id."$TF_VAR_DOMAIN
export TF_VAR_JWT_AUDIENCE="https://"$TF_VAR_DOMAIN
export TF_VAR_JWT_SECRET="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
export TF_VAR_JWT_TIME="10:00:00"

# 🧑‍💻 GITHUB
export TF_VAR_GITHUB_NAME="github"
export TF_VAR_GITHUB_USER="SomeUsername"
export TF_VAR_GITHUB_EMAIL=$TF_VAR_GITHUB_USER"@example.com"

# 🔑 SET SECRETS
# -- google
export TF_VAR_GOOGLE_TEXTTOSPEECH_API_KEY="YourGoogleTextToSpeechApiKey"
# -- npm
export TF_VAR_NPM_NAME="npm"
export TF_VAR_NPM_USER="admin@"$TF_VAR_DOMAIN
export TF_VAR_NPM_PASSWORD="changeme"
# -- mail-in-a-box
export TF_VAR_MAILINABOX_DOMAIN="box."$TF_VAR_DOMAIN
export TF_VAR_MAILINABOX_USER="admin@"$TF_VAR_DOMAIN
export TF_VAR_MAILINABOX_PASSWORD="UltraSecretPassword123!"
# -- ollama
export TF_VAR_OLLAMA_NAME="ollama"
# -- chatgpt
export TF_VAR_CHATGPT_NAME="chatgpt"
# -- postgres
export TF_VAR_POSTGRES_NAME="postgres"
export TF_VAR_POSTGRES_USER="SomeUsername"
export TF_VAR_POSTGRES_PASSWORD="UltraSecretPassword123!"
# -- mysql
export TF_VAR_MYSQL_NAME="mysql"
export TF_VAR_MYSQL_USER="SomeUsername"
export TF_VAR_MYSQL_PASSWORD="UltraSecretPassword123!"
# -- mariadb
export TF_VAR_MARIADB_NAME="mariadb"
export TF_VAR_MARIADB_USER="SomeUsername"
export TF_VAR_MARIADB_PASSWORD="UltraSecretPassword123!"
# -- redis
export TF_VAR_REDIS_NAME="redis"
export TF_VAR_REDIS_USER="SomeUsername"
export TF_VAR_REDIS_PASSWORD="UltraSecretPassword123!"
# -- prometheus
export TF_VAR_PROMETHEUS_NAME="prometheus"
export TF_VAR_PROMETHEUS_USER="SomeUsername"
export TF_VAR_PROMETHEUS_PASSWORD="UltraSecretPassword123!"
# -- elasticsearch
export TF_VAR_ELASTICSEARCH_NAME="elasticsearch"
export TF_VAR_ELASTICSEARCH_USER="SomeUsername"
export TF_VAR_ELASTICSEARCH_PASSWORD="UltraSecretPassword123!"
# -- kibana
export TF_VAR_KIBANA_NAME="kibana"
# -- grafana
export TF_VAR_GRAFANA_NAME="grafana"
export TF_VAR_GRAFANA_USER="admin"
export TF_VAR_GRAFANA_PASSWORD="admin"
# -- pgadmin
export TF_VAR_PGADMIN_NAME="pgadmin"
export TF_VAR_PGADMIN_USER=$TF_VAR_MAILINABOX_USER
export TF_VAR_PGADMIN_PASSWORD="UltraSecretPassword123!"
# -- phpmyadmin
export TF_VAR_PHPMYADMIN_NAME="phpmyadmin"
# -- vault
export TF_VAR_VAULT_NAME="vault"
export TF_VAR_VAULT_TOKEN_ROOT="77777777-7777-7777-7777-777777777777"
export TF_VAR_VAULT_TOKEN_USER="00000000-0000-0000-0000-000000000000"
# -- vaultwarden
export TF_VAR_VAULTWARDEN_NAME="vaultwarden"
export TF_VAR_VAULTWARDEN_DOMAIN=$TF_VAR_VAULTWARDEN_NAME"."$TF_VAR_DOMAIN
export TF_VAR_VAULTWARDEN_ADMIN_PASSWORD="UltraSecretPassword123!"
export TF_VAR_VAULTWARDEN_ADMIN_TOKEN='$argon2id$v=19$m=65540,t=3,p=4$gxCIeCjT3gHdbVwWKd86lHjq1wWp6a9+NlScRmaeBOw$XKlvjpjCIjy6kfVPjSpOHe2mjA5TOeoxPwLnb9uzYRY'
# -- keycloak
export TF_VAR_KEYCLOAK_NAME="keycloak"
export TF_VAR_KEYCLOAK_USER="SomeUsername"
export TF_VAR_KEYCLOAK_PASSWORD="UltraSecretPassword123!"
# -- twingate
export TF_VAR_TWINGATE_NAME="twingate"
export TF_VAR_TWINGATE_DOMAIN="twingate.com"
export TF_VAR_TWINGATE_TENANT_NETWORK="SomeNetwork"
export TF_VAR_TWINGATE_ACCESS_TOKEN="UltraSecretPassword123!"
export TF_VAR_TWINGATE_REFRESH_TOKEN="UltraSecretPassword123!"
export TF_VAR_TWINGATE_LABEL_HOSTNAME="`hostname`"
# -- guacamole
export TF_VAR_GUACD_NAME="guacd"
export TF_VAR_GUACAMOLE_NAME="guacamole"
export TF_VAR_GUACAMOLE_USER="guacadmin"
export TF_VAR_GUACAMOLE_PASSWORD="guacadmin"
# -- filebrowser
export TF_VAR_FILEBROWSER_NAME="filebrowser"
export TF_VAR_FILEBROWSER_USER="admin"
export TF_VAR_FILEBROWSER_PASSWORD="admin"
# -- kutt
export TF_VAR_KUTT_NAME="kutt"
export TF_VAR_KUTT_PASSWORD="UltraSecretPassword123!"
# -- searxng
export TF_VAR_SEARXNG_NAME="searxng"
# -- dashy
export TF_VAR_DASHY_NAME="dashy"
# -- uptime-kuma
export TF_VAR_UPTIMEKUMA_NAME="uptime-kuma"
export TF_VAR_UPTIMEKUMA_USER=$TF_VAR_MAILINABOX_USER
export TF_VAR_UPTIMEKUMA_PASSWORD="UltraSecretPassword123!"
# -- listmonk
export TF_VAR_LISTMONK_NAME="listmonk"
export TF_VAR_LISTMONK_USER="listmonk"
export TF_VAR_LISTMONK_PASSWORD="listmonk"
# -- freescout 
export TF_VAR_FREESCOUT_NAME="freescout"
export TF_VAR_FREESCOUT_PASSWORD="UltraSecretPassword123"
export TF_VAR_FREESCOUT_TZ="Etc/UTC"
# -- rustdesk
export TF_VAR_RUSTDESK_NAME="rustdesk"
export TF_VAR_RUSTDESK_USER="admin"
export TF_VAR_RUSTDESK_PASSWORD="test1234"
# -- rabbitmq
export TF_VAR_RABBITMQ_NAME="rabbitmq"
export TF_VAR_RABBITMQ_USER="SomeUsername"
export TF_VAR_RABBITMQ_PASSWORD="UltraSecretPassword123!"
# -- harbor
export TF_VAR_HARBOR_NAME="harbor" 
export TF_VAR_HARBOR_USER="admin"
export TF_VAR_HARBOR_PASSWORD="UltraSecretPassword123!"
export TF_VAR_HARBOR_HTTP_SECRET="UltraSecretPassword123!"
export TF_VAR_HARBOR_CORE_SECRET="UltraSecretPassword123!"
export TF_VAR_HARBOR_JOBSERVICE_SECRET="UltraSecretPassword123!"
# -- gitlab
export TF_VAR_GITLAB_NAME="gitlab"
export TF_VAR_GITLAB_USER="admin"
export TF_VAR_GITLAB_PASSWORD="UltraSecretPassword123!"
export TF_VAR_GITLAB_KEY_DB="UltraSecretPassword123!"
export TF_VAR_GITLAB_KEY_SECRET="UltraSecretPassword123!"
export TF_VAR_GITLAB_KEY_OTP="UltraSecretPassword123!"
export TF_VAR_GITLAB_TZ="Europe/Brussel"
# -- code-server
export TF_VAR_CODESERVER_NAME="code-server"
export TF_VAR_CODESERVER_USER="abc"
export TF_VAR_CODESERVER_PASSWORD="UltraSecretPassword123!"
export TF_VAR_CODESERVER_TZ="Etc/UTC"
# -- jenkins
export TF_VAR_JENKINS_NAME="jenkins"
export TF_VAR_JENKINS_USER="admin"
export TF_VAR_JENKINS_PASSWORD="UltraSecretPassword123!"
# -- phoneinfoga
export TF_VAR_PHONEINFOGA_NAME="phoneinfoga"
export TF_VAR_PHONEINFOGA_NUMVERIFY_API_KEY="UltraSecretPassword123!"
export TF_VAR_PHONEINFOGA_GOOGLE_CSE_CX="UltraSecretPassword123!"
export TF_VAR_PHONEINFOGA_GOOGLE_API_KEY="UltraSecretPassword123!"
# -- sherlock
export TF_VAR_SHERLOCK_NAME="sherlock"
# -- storm-breaker
export TF_VAR_STORMBREAKER_NAME="storm-breaker"
export TF_VAR_STORMBREAKER_USER="SomeUsername"
export TF_VAR_STORMBREAKER_PASSWORD="UltraSecretPassword123!"
export TF_VAR_STORMBREAKER_NGROK_API_KEY="UltraSecretPassword123!"
# -- softether
export TF_VAR_SOFTETHER_NAME="softether"
# -- beef
export TF_VAR_BEEF_NAME="beef"
export TF_VAR_BEEF_USER="SomeUsername"
export TF_VAR_BEEF_PASSWORD="UltraSecretPassword123!"
# -- ubuntu
export TF_VAR_UBUNTU_NAME="ubuntu"
# -- kali
export TF_VAR_KALI_NAME="kali"
# -- hack
export TF_VAR_HACK_NAME="hack"

# 🚀 SMTPAPPS
# -- checkmail
export TF_VAR_CHECKMAIL_BACK="checkmail-back"

# ✉️ SMTP
# -- box
export TF_VAR_SMTP_HOST=$TF_VAR_MAILINABOX_DOMAIN
export TF_VAR_SMTP_SECURITY="starttls"
export TF_VAR_SMTP_STARTTLS=true
export TF_VAR_SMTP_PORT=587
export TF_VAR_SMTP_USERNAME=$TF_VAR_MAILINABOX_USER
export TF_VAR_SMTP_PASSWORD=$TF_VAR_MAILINABOX_PASSWORD
export TF_VAR_IMAP_HOST=$TF_VAR_MAILINABOX_DOMAIN
export TF_VAR_IMAP_PORT=993
export TF_VAR_IMAP_SSL=true
export TF_VAR_IMAP_STARTTLS=false
export TF_VAR_IMAP_USERNAME=$TF_VAR_MAILINABOX_USER
export TF_VAR_IMAP_PASSWORD=$TF_VAR_MAILINABOX_PASSWORD
# -- gmail (overrides box in case port 25 is blocked)
export TF_VAR_SMTP_HOST="smtp.gmail.com"
export TF_VAR_SMTP_SECURITY="starttls"
export TF_VAR_SMTP_STARTTLS=true
export TF_VAR_SMTP_PORT=587
export TF_VAR_SMTP_USERNAME="example@gmail.com"
export TF_VAR_SMTP_PASSWORD="UltraSecretPassword123!"
export TF_VAR_IMAP_HOST="imap.gmail.com"
export TF_VAR_IMAP_PORT=993
export TF_VAR_IMAP_SSL=true
export TF_VAR_IMAP_STARTTLS=false
export TF_VAR_IMAP_USERNAME="example@gmail.com"
export TF_VAR_IMAP_PASSWORD="UltraSecretPassword123!"
