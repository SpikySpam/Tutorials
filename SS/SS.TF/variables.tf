locals {
  VARS = {
    PREFIX      = var.PREFIX
    PROVIDER    = var.PROVIDER
    ENVIRONMENT = var.ENVIRONMENT
    REGION      = var.REGION
    WORKSPACE   = terraform.workspace
    DOMAIN      = "${var.PREFIX != var.PREFIX_NONE ? "${var.PREFIX}." : var.PREFIX}${var.ENVIRONMENT != var.ENVIRONMENT_PRD ? "${var.ENVIRONMENT}." : ""}${var.HOST}"
    CLUSTERNAME = "${var.PREFIX != var.PREFIX_NONE ? "${var.PREFIX}-" : var.PREFIX}${var.REGION != var.REGION_NONE ? "${var.REGION}-" : ""}${var.ENVIRONMENT}"
    HOST        = var.HOST
    OSTYPE      = var.OSTYPE
    COT         = var.COT

    PATHS = {
      PATH              = var.PATH
      PATH_HOME         = var.PATH_HOME
      PATH_MAIN         = var.PATH_MAIN
      PATH_APP          = var.PATH_APP
      PATH_CLI          = var.PATH_CLI
      PATH_HELP         = var.PATH_HELP
      PATH_SERVICES     = var.PATH_SERVICES
      PATH_TERRAFORM    = var.PATH_TERRAFORM
    }

    CONSTANTS = {
      OS = {
        OSTYPE_LINUX    = var.OSTYPE_LINUX
        OSTYPE_WINDOWS  = var.OSTYPE_WINDOWS
      }
      CONTAINER = {
        COT_DOCKER      = var.COT_DOCKER
        COT_PODMAN      = var.COT_PODMAN
      }
      PREFIX = {
        PREFIX_NONE     = var.PREFIX_NONE
        PREFIX_CTRL     = var.PREFIX_CTRL
      }
      PROVIDER = {
        PROVIDER_KIND   = var.PROVIDER_KIND
        PROVIDER_DIGO   = var.PROVIDER_DIGO
        PROVIDER_VULT   = var.PROVIDER_VULT
        PROVIDER_CIVO   = var.PROVIDER_CIVO
        PROVIDER_LINO   = var.PROVIDER_LINO
        PROVIDER_GOOG   = var.PROVIDER_GOOG
        PROVIDER_AZUR   = var.PROVIDER_AZUR
        PROVIDER_AMWS   = var.PROVIDER_AMWS
      }
      ENVIRONMENT = {
        ENVIRONMENT_DEV = var.ENVIRONMENT_DEV
        HOST_SPIKYSPAM  = var.HOST_SPIKYSPAM
      }
      REGION = {
        REGION_NONE     = var.REGION_NONE
      }
      HOST = {
        HOST_EXAMPLE    = var.HOST_EXAMPLE
        HOST_SPIKYSPAM  = var.HOST_SPIKYSPAM
      }
    }

    VERSIONS = {
      APP = {
        VERSION_APP_CHECKMAIL_BACK     = var.VERSION_APP_CHECKMAIL_BACK
      }
      CLI = {
        VERSION_CLI_GITLEAKS           = var.VERSION_CLI_GITLEAKS
        VERSION_CLI_HELM               = var.VERSION_CLI_HELM
        VERSION_CLI_JQ                 = var.VERSION_CLI_JQ
        VERSION_CLI_K6                 = var.VERSION_CLI_K6
        VERSION_CLI_K9S                = var.VERSION_CLI_K9S
        VERSION_CLI_KIND               = var.VERSION_CLI_KIND
        VERSION_CLI_KUBECTL            = var.VERSION_CLI_KUBECTL
        VERSION_CLI_LYCHEE             = var.VERSION_CLI_LYCHEE
        VERSION_CLI_PODMAN             = var.VERSION_CLI_PODMAN
        VERSION_CLI_POPEYE             = var.VERSION_CLI_POPEYE
        VERSION_CLI_STEP               = var.VERSION_CLI_STEP
        VERSION_CLI_TERRAFORM          = var.VERSION_CLI_TERRAFORM
      }
      CLUSTER = {
        VERSION_CLUSTER_KIND           = var.VERSION_CLUSTER_KIND
        VERSION_CLUSTER_DO             = var.VERSION_CLUSTER_DO
        VERSION_CLUSTER_VULTR          = var.VERSION_CLUSTER_VULTR
        VERSION_CLUSTER_CIVO           = var.VERSION_CLUSTER_CIVO
        VERSION_CLUSTER_LINODE         = var.VERSION_CLUSTER_LINODE
        VERSION_CLUSTER_GOOGLE         = var.VERSION_CLUSTER_GOOGLE
        VERSION_CLUSTER_AZURE          = var.VERSION_CLUSTER_AZURE
        VERSION_CLUSTER_AWS            = var.VERSION_CLUSTER_AWS
      }
      DOCKER = {
        VERSION_DOCKER_NGINX           = var.VERSION_DOCKER_NGINX
        VERSION_DOCKER_NPM             = var.VERSION_DOCKER_NPM
        VERSION_DOCKER_TRAEFIK         = var.VERSION_DOCKER_TRAEFIK
        VERSION_DOCKER_CASSANDRA       = var.VERSION_DOCKER_CASSANDRA
        VERSION_DOCKER_CASSANDRA_WEB   = var.VERSION_DOCKER_CASSANDRA_WEB
        VERSION_DOCKER_POSTGRES        = var.VERSION_DOCKER_POSTGRES
        VERSION_DOCKER_MYSQL           = var.VERSION_DOCKER_MYSQL
        VERSION_DOCKER_MARIADB         = var.VERSION_DOCKER_MARIADB
        VERSION_DOCKER_MONGODB         = var.VERSION_DOCKER_MONGODB
        VERSION_DOCKER_MONGODB_EXPRESS = var.VERSION_DOCKER_MONGODB_EXPRESS
        VERSION_DOCKER_REDIS           = var.VERSION_DOCKER_REDIS
        VERSION_DOCKER_PROMETHEUS      = var.VERSION_DOCKER_PROMETHEUS
        VERSION_DOCKER_ELASTICSEARCH   = var.VERSION_DOCKER_ELASTICSEARCH
        VERSION_DOCKER_KIBANA          = var.VERSION_DOCKER_KIBANA
        VERSION_DOCKER_GRAFANA         = var.VERSION_DOCKER_GRAFANA
        VERSION_DOCKER_PGADMIN         = var.VERSION_DOCKER_PGADMIN
        VERSION_DOCKER_PHPMYADMIN      = var.VERSION_DOCKER_PHPMYADMIN
        VERSION_DOCKER_VAULT           = var.VERSION_DOCKER_VAULT
        VERSION_DOCKER_VAULTWARDEN     = var.VERSION_DOCKER_VAULTWARDEN
        VERSION_DOCKER_KEYCLOAK        = var.VERSION_DOCKER_KEYCLOAK
        VERSION_DOCKER_TWINGATE        = var.VERSION_DOCKER_TWINGATE
        VERSION_DOCKER_GUACD           = var.VERSION_DOCKER_GUACD
        VERSION_DOCKER_GUACAMOLE       = var.VERSION_DOCKER_GUACAMOLE
        VERSION_DOCKER_PIHOLE          = var.VERSION_DOCKER_PIHOLE
        VERSION_DOCKER_FILEBROWSER     = var.VERSION_DOCKER_FILEBROWSER
        VERSION_DOCKER_KUTT            = var.VERSION_DOCKER_KUTT
        VERSION_DOCKER_SEARXNG         = var.VERSION_DOCKER_SEARXNG
        VERSION_DOCKER_DASHY           = var.VERSION_DOCKER_DASHY
        VERSION_DOCKER_UPTIMEKUMA      = var.VERSION_DOCKER_UPTIMEKUMA
        VERSION_DOCKER_LISTMONK        = var.VERSION_DOCKER_LISTMONK
        VERSION_DOCKER_FREESCOUT       = var.VERSION_DOCKER_FREESCOUT
        VERSION_DOCKER_RUSTDESK        = var.VERSION_DOCKER_RUSTDESK
        VERSION_DOCKER_STIRLINGPDF     = var.VERSION_DOCKER_STIRLINGPDF
        VERSION_DOCKER_RABBITMQ        = var.VERSION_DOCKER_RABBITMQ
        VERSION_DOCKER_HARBOR          = var.VERSION_DOCKER_HARBOR
        VERSION_DOCKER_GITLAB          = var.VERSION_DOCKER_GITLAB
        VERSION_DOCKER_CODESERVER      = var.VERSION_DOCKER_CODESERVER
        VERSION_DOCKER_JENKINS         = var.VERSION_DOCKER_JENKINS
        VERSION_DOCKER_PHONEINFOGA     = var.VERSION_DOCKER_PHONEINFOGA
        VERSION_DOCKER_SOFTETHER       = var.VERSION_DOCKER_SOFTETHER
        VERSION_DOCKER_BEEF            = var.VERSION_DOCKER_BEEF
        VERSION_DOCKER_UBUNTU          = var.VERSION_DOCKER_UBUNTU
        VERSION_DOCKER_KALI            = var.VERSION_DOCKER_KALI
        VERSION_DOCKER_RUBY            = var.VERSION_DOCKER_RUBY
        VERSION_DOCKER_PYTHON          = var.VERSION_DOCKER_PYTHON
        VERSION_DOCKER_PUTER           = var.VERSION_DOCKER_PUTER
        VERSION_DOCKER_OLLAMA          = var.VERSION_DOCKER_OLLAMA
      }
      HELM = {
      }
      TERRAFORM = {
        VERSION_TF_KIND                = var.VERSION_TF_KIND
        VERSION_TF_DOCKER                = var.VERSION_TF_DOCKER
      }
    }

    PORTS = {
      NETWORK = {
        NGINX_PORT_INT                 = var.NGINX_PORT_INT
        NGINX_PORT_EXT                 = var.NGINX_PORT_EXT
      }
      DATABASES = {
        CASSANDRA_PORT_INT             = var.CASSANDRA_PORT_INT
        CASSANDRA_PORT_EXT             = var.CASSANDRA_PORT_EXT
        CASSANDRA_WEB_PORT_INT         = var.CASSANDRA_WEB_PORT_INT
        CASSANDRA_WEB_PORT_EXT         = var.CASSANDRA_WEB_PORT_EXT
        POSTGRES_PORT_INT              = var.POSTGRES_PORT_INT
        POSTGRES_PORT_EXT              = var.POSTGRES_PORT_EXT
        MYSQL_PORT_INT                 = var.MYSQL_PORT_INT
        MYSQL_PORT_EXT                 = var.MYSQL_PORT_EXT
        MARIADB_PORT_INT               = var.MARIADB_PORT_INT
        MARIADB_PORT_EXT               = var.MARIADB_PORT_EXT
        MONGODB_PORT_INT               = var.MONGODB_PORT_INT
        MONGODB_PORT_EXT               = var.MONGODB_PORT_EXT
        REDIS_PORT_INT                 = var.REDIS_PORT_INT
        REDIS_PORT_EXT                 = var.REDIS_PORT_EXT
        PROMETHEUS_PORT_INT            = var.PROMETHEUS_PORT_INT
        PROMETHEUS_PORT_EXT            = var.PROMETHEUS_PORT_EXT
        ELASTICSEARCH_PORT_INT         = var.ELASTICSEARCH_PORT_INT
        ELASTICSEARCH_PORT_EXT         = var.ELASTICSEARCH_PORT_EXT
        KIBANA_PORT_INT                = var.KIBANA_PORT_INT
        KIBANA_PORT_EXT                = var.KIBANA_PORT_EXT
        GRAFANA_PORT_INT               = var.GRAFANA_PORT_INT
        GRAFANA_PORT_EXT               = var.GRAFANA_PORT_EXT
        PGADMIN_PORT_INT               = var.PGADMIN_PORT_INT
        PGADMIN_PORT_EXT               = var.PGADMIN_PORT_EXT
        PHPMYADMIN_PORT_INT            = var.PHPMYADMIN_PORT_INT
        PHPMYADMIN_PORT_EXT            = var.PHPMYADMIN_PORT_EXT
      }
      SECURITY = {
        VAULT_PORT_INT                 = var.VAULT_PORT_INT
        VAULT_PORT_EXT                 = var.VAULT_PORT_EXT
        VAULTWARDEN_PORT_INT           = var.VAULTWARDEN_PORT_INT
        VAULTWARDEN_PORT_EXT           = var.VAULTWARDEN_PORT_EXT
        KEYCLOAK_PORT_INT              = var.KEYCLOAK_PORT_INT
        KEYCLOAK_PORT_EXT              = var.KEYCLOAK_PORT_EXT
        GUACD_PORT_INT                 = var.GUACD_PORT_INT
        GUACD_PORT_EXT                 = var.GUACD_PORT_EXT
        GUACAMOLE_PORT_INT             = var.GUACAMOLE_PORT_INT
        GUACAMOLE_PORT_EXT             = var.GUACAMOLE_PORT_EXT
        PIHOLE_PORT_INT_53             = var.PIHOLE_PORT_INT_53
        PIHOLE_PORT_EXT_53             = var.PIHOLE_PORT_EXT_53
        PIHOLE_PORT_INT_67             = var.PIHOLE_PORT_INT_67
        PIHOLE_PORT_EXT_67             = var.PIHOLE_PORT_EXT_67
        PIHOLE_PORT_INT_80             = var.PIHOLE_PORT_INT_80
        PIHOLE_PORT_EXT_80             = var.PIHOLE_PORT_EXT_80
        TRAEFIK_PORT_INT_80            = var.TRAEFIK_PORT_INT_80
        TRAEFIK_PORT_EXT_80            = var.TRAEFIK_PORT_EXT_80
        TRAEFIK_PORT_INT_443           = var.TRAEFIK_PORT_INT_443
        TRAEFIK_PORT_EXT_443           = var.TRAEFIK_PORT_EXT_443
        TRAEFIK_PORT_INT_8080          = var.TRAEFIK_PORT_INT_8080
        TRAEFIK_PORT_EXT_8080          = var.TRAEFIK_PORT_EXT_8080
      }
      TOOLS = {
        FILEBROWSER_PORT_INT           = var.FILEBROWSER_PORT_INT
        FILEBROWSER_PORT_EXT           = var.FILEBROWSER_PORT_EXT
        KUTT_PORT_INT                  = var.KUTT_PORT_INT
        KUTT_PORT_EXT                  = var.KUTT_PORT_EXT
        SEARXNG_PORT_INT               = var.SEARXNG_PORT_INT
        SEARXNG_PORT_EXT               = var.SEARXNG_PORT_EXT
        DASHY_PORT_INT                 = var.DASHY_PORT_INT
        DASHY_PORT_EXT                 = var.DASHY_PORT_EXT
        UPTIMEKUMA_PORT_INT            = var.UPTIMEKUMA_PORT_INT
        UPTIMEKUMA_PORT_EXT            = var.UPTIMEKUMA_PORT_EXT
        LISTMONK_PORT_INT              = var.LISTMONK_PORT_INT
        LISTMONK_PORT_EXT              = var.LISTMONK_PORT_EXT
        FREESCOUT_PORT_INT             = var.FREESCOUT_PORT_INT
        FREESCOUT_PORT_EXT             = var.FREESCOUT_PORT_EXT
        RUSTDESK_SIGNAL_PORT_INT_21114 = var.RUSTDESK_SIGNAL_PORT_INT_21114
        RUSTDESK_SIGNAL_PORT_EXT_21114 = var.RUSTDESK_SIGNAL_PORT_EXT_21114
        RUSTDESK_SIGNAL_PORT_INT_21115 = var.RUSTDESK_SIGNAL_PORT_INT_21115
        RUSTDESK_SIGNAL_PORT_EXT_21115 = var.RUSTDESK_SIGNAL_PORT_EXT_21115
        RUSTDESK_SIGNAL_PORT_INT_21116 = var.RUSTDESK_SIGNAL_PORT_INT_21116
        RUSTDESK_SIGNAL_PORT_EXT_21116 = var.RUSTDESK_SIGNAL_PORT_EXT_21116
        RUSTDESK_SIGNAL_PORT_INT_21118 = var.RUSTDESK_SIGNAL_PORT_INT_21118
        RUSTDESK_SIGNAL_PORT_EXT_21118 = var.RUSTDESK_SIGNAL_PORT_EXT_21118
        RUSTDESK_RELAY_PORT_INT_21117  = var.RUSTDESK_RELAY_PORT_INT_21117
        RUSTDESK_RELAY_PORT_EXT_21117  = var.RUSTDESK_RELAY_PORT_EXT_21117
        RUSTDESK_RELAY_PORT_INT_21119  = var.RUSTDESK_RELAY_PORT_INT_21119
        RUSTDESK_RELAY_PORT_EXT_21119  = var.RUSTDESK_RELAY_PORT_EXT_21119
        STIRLINGPDF_PORT_INT           = var.STIRLINGPDF_PORT_INT
        STIRLINGPDF_PORT_EXT           = var.STIRLINGPDF_PORT_EXT
      }
      DEVELOPMENT = {
        RABBITMQ_PORT_INT_NODE         = var.RABBITMQ_PORT_INT_NODE
        RABBITMQ_PORT_EXT_NODE         = var.RABBITMQ_PORT_EXT_NODE
        RABBITMQ_PORT_INT_DIST         = var.RABBITMQ_PORT_INT_DIST
        RABBITMQ_PORT_EXT_DIST         = var.RABBITMQ_PORT_EXT_DIST
        HARBOR_PORT_INT                = var.HARBOR_PORT_INT
        HARBOR_PORT_EXT                = var.HARBOR_PORT_EXT
        HARBOR_PORT_INT_REGISTRY       = var.HARBOR_PORT_INT_REGISTRY
        HARBOR_PORT_EXT_REGISTRY       = var.HARBOR_PORT_EXT_REGISTRY
        GITLAB_PORT_INT_80             = var.GITLAB_PORT_INT_80
        GITLAB_PORT_EXT_80             = var.GITLAB_PORT_EXT_80
        GITLAB_PORT_INT_443            = var.GITLAB_PORT_INT_443
        GITLAB_PORT_EXT_443            = var.GITLAB_PORT_EXT_443
        GITLAB_PORT_INT_22             = var.GITLAB_PORT_INT_22
        GITLAB_PORT_EXT_22             = var.GITLAB_PORT_EXT_22
        CODESERVER_PORT_INT            = var.CODESERVER_PORT_INT
        CODESERVER_PORT_EXT            = var.CODESERVER_PORT_EXT
        JENKINS_PORT_INT               = var.JENKINS_PORT_INT
        JENKINS_PORT_EXT               = var.JENKINS_PORT_EXT
        JENKINS_PORT_INT_50000         = var.JENKINS_PORT_INT_50000
        JENKINS_PORT_EXT_50000         = var.JENKINS_PORT_EXT_50000
      }
      OS = {
        PUTER_PORT_INT                 = var.PUTER_PORT_INT
        PUTER_PORT_EXT                 = var.PUTER_PORT_EXT
      }
      HACK = {
        PHONEINFOGA_PORT_INT           = var.PHONEINFOGA_PORT_INT
        PHONEINFOGA_PORT_EXT           = var.PHONEINFOGA_PORT_EXT
        STORMBREAKER_PORT_INT          = var.STORMBREAKER_PORT_INT
        STORMBREAKER_PORT_EXT          = var.STORMBREAKER_PORT_EXT
        SOFTETHER_PORT_INT_443         = var.SOFTETHER_PORT_INT_443
        SOFTETHER_PORT_EXT_443         = var.SOFTETHER_PORT_EXT_443
        SOFTETHER_PORT_INT_5555        = var.SOFTETHER_PORT_INT_5555
        SOFTETHER_PORT_EXT_5555        = var.SOFTETHER_PORT_EXT_5555
        SOFTETHER_PORT_INT_992         = var.SOFTETHER_PORT_INT_992
        SOFTETHER_PORT_EXT_992         = var.SOFTETHER_PORT_EXT_992
        SOFTETHER_PORT_INT_500         = var.SOFTETHER_PORT_INT_500
        SOFTETHER_PORT_EXT_500         = var.SOFTETHER_PORT_EXT_500
        SOFTETHER_PORT_INT_4500        = var.SOFTETHER_PORT_INT_4500
        SOFTETHER_PORT_EXT_4500        = var.SOFTETHER_PORT_EXT_4500
        SOFTETHER_PORT_INT_1701        = var.SOFTETHER_PORT_INT_1701
        SOFTETHER_PORT_EXT_1701        = var.SOFTETHER_PORT_EXT_1701
        SOFTETHER_PORT_INT_1194        = var.SOFTETHER_PORT_INT_1194
        SOFTETHER_PORT_EXT_1194        = var.SOFTETHER_PORT_EXT_1194
        BEEF_PORT_INT_3000             = var.BEEF_PORT_INT_3000
        BEEF_PORT_EXT_3000             = var.BEEF_PORT_EXT_3000
        BEEF_PORT_INT_6789             = var.BEEF_PORT_INT_6789
        BEEF_PORT_EXT_6789             = var.BEEF_PORT_EXT_6789
        BEEF_PORT_INT_61985            = var.BEEF_PORT_INT_61985
        BEEF_PORT_EXT_61985            = var.BEEF_PORT_EXT_61985
        BEEF_PORT_INT_61986            = var.BEEF_PORT_INT_61986
        BEEF_PORT_EXT_61986            = var.BEEF_PORT_EXT_61986
      }
      AI = {
        CHATGPT_PORT_INT               = var.CHATGPT_PORT_INT
        CHATGPT_PORT_EXT               = var.CHATGPT_PORT_EXT
      }
      OWN = {
        CHECKMAIL_BACK_PORT_80_INT     = var.CHECKMAIL_BACK_PORT_80_INT
        CHECKMAIL_BACK_PORT_80_EXT     = var.CHECKMAIL_BACK_PORT_80_EXT
        CHECKMAIL_BACK_PORT_443_INT    = var.CHECKMAIL_BACK_PORT_443_INT
        CHECKMAIL_BACK_PORT_443_EXT    = var.CHECKMAIL_BACK_PORT_443_EXT
      }
    }

    SECRETS = {
      JWT = {
        JWT_ISSUER                     = var.JWT_ISSUER
        JWT_AUDIENCE                   = var.JWT_AUDIENCE
        JWT_SECRET                     = var.JWT_SECRET
        JWT_TIME                       = var.JWT_TIME
      }
      PROVIDERS = {
        GITHUB_NAME                    = var.GITHUB_NAME
        GITHUB_USER                    = var.GITHUB_USER
        GITHUB_EMAIL                   = var.GITHUB_EMAIL
        GOOGLE_TEXTTOSPEECH_API_KEY    = var.GOOGLE_TEXTTOSPEECH_API_KEY
      }
      NETWORK = {
        NGINX_NAME                     = var.NGINX_NAME
        NPM_NAME                       = var.NPM_NAME
        NPM_USER                       = var.NPM_USER
        NPM_PASSWORD                   = var.NPM_PASSWORD
        TRAEFIK_NAME                   = var.TRAEFIK_NAME
        TRAEFIK_USER                   = var.TRAEFIK_USER
        TRAEFIK_PASSWORD               = var.TRAEFIK_PASSWORD
        MAILINABOX_DOMAIN              = var.MAILINABOX_DOMAIN
        MAILINABOX_USER                = var.MAILINABOX_USER
        MAILINABOX_PASSWORD            = var.MAILINABOX_PASSWORD
      }
      DATABASES = {
        CASSANDRA_NAME                 = var.CASSANDRA_NAME
        CASSANDRA_USER                 = var.CASSANDRA_USER
        CASSANDRA_PASSWORD             = var.CASSANDRA_PASSWORD
        POSTGRES_NAME                  = var.POSTGRES_NAME
        POSTGRES_USER                  = var.POSTGRES_USER
        POSTGRES_PASSWORD              = var.POSTGRES_PASSWORD
        MYSQL_NAME                     = var.MYSQL_NAME
        MYSQL_USER                     = var.MYSQL_USER
        MYSQL_PASSWORD                 = var.MYSQL_PASSWORD
        MARIADB_NAME                   = var.MARIADB_NAME
        MARIADB_USER                   = var.MARIADB_USER
        MARIADB_PASSWORD               = var.MARIADB_PASSWORD
        MONGODB_NAME                   = var.MONGODB_NAME
        MONGODB_USER                   = var.MONGODB_USER
        MONGODB_PASSWORD               = var.MONGODB_PASSWORD
        REDIS_NAME                     = var.REDIS_NAME
        REDIS_USER                     = var.REDIS_USER
        REDIS_PASSWORD                 = var.REDIS_PASSWORD
        PROMETHEUS_NAME                = var.PROMETHEUS_NAME
        PROMETHEUS_USER                = var.PROMETHEUS_USER
        PROMETHEUS_PASSWORD            = var.PROMETHEUS_PASSWORD
        ELASTICSEARCH_NAME             = var.ELASTICSEARCH_NAME
        ELASTICSEARCH_USER             = var.ELASTICSEARCH_USER
        ELASTICSEARCH_PASSWORD         = var.ELASTICSEARCH_PASSWORD
        KIBANA_NAME                    = var.KIBANA_NAME
        GRAFANA_NAME                   = var.GRAFANA_NAME
        GRAFANA_USER                   = var.GRAFANA_USER
        GRAFANA_PASSWORD               = var.GRAFANA_PASSWORD
        PGADMIN_NAME                   = var.PGADMIN_NAME
        PGADMIN_USER                   = var.PGADMIN_USER
        PGADMIN_PASSWORD               = var.PGADMIN_PASSWORD
        PHPMYADMIN_NAME                = var.PHPMYADMIN_NAME
      }
      SECURITY = {
        VAULT_NAME                     = var.VAULT_NAME
        VAULT_TOKEN_ROOT               = var.VAULT_TOKEN_ROOT
        VAULT_TOKEN_USER               = var.VAULT_TOKEN_USER
        VAULTWARDEN_NAME               = var.VAULTWARDEN_NAME
        VAULTWARDEN_DOMAIN             = var.VAULTWARDEN_DOMAIN
        VAULTWARDEN_ADMIN_PASSWORD     = var.VAULTWARDEN_ADMIN_PASSWORD
        VAULTWARDEN_ADMIN_TOKEN        = var.VAULTWARDEN_ADMIN_TOKEN
        KEYCLOAK_NAME                  = var.KEYCLOAK_NAME
        KEYCLOAK_USER                  = var.KEYCLOAK_USER
        KEYCLOAK_PASSWORD              = var.KEYCLOAK_PASSWORD
        TWINGATE_NAME                  = var.TWINGATE_NAME
        TWINGATE_DOMAIN                = var.TWINGATE_DOMAIN
        TWINGATE_TENANT_NETWORK        = var.TWINGATE_TENANT_NETWORK
        TWINGATE_ACCESS_TOKEN          = var.TWINGATE_ACCESS_TOKEN
        TWINGATE_REFRESH_TOKEN         = var.TWINGATE_REFRESH_TOKEN
        TWINGATE_LABEL_HOSTNAME        = var.TWINGATE_LABEL_HOSTNAME
        GUACD_NAME                     = var.GUACD_NAME
        GUACAMOLE_NAME                 = var.GUACAMOLE_NAME
        GUACAMOLE_USER                 = var.GUACAMOLE_USER
        GUACAMOLE_PASSWORD             = var.GUACAMOLE_PASSWORD
        PIHOLE_NAME                    = var.PIHOLE_NAME
        PIHOLE_PASSWORD                = var.PIHOLE_PASSWORD
        PIHOLE_TZ                      = var.PIHOLE_TZ
      }
      TOOLS = {
        FILEBROWSER_NAME               = var.FILEBROWSER_NAME
        FILEBROWSER_USER               = var.FILEBROWSER_USER
        FILEBROWSER_PASSWORD           = var.FILEBROWSER_PASSWORD
        KUTT_NAME                      = var.KUTT_NAME
        KUTT_PASSWORD                  = var.KUTT_PASSWORD
        SEARXNG_NAME                   = var.SEARXNG_NAME
        DASHY_NAME                     = var.DASHY_NAME
        UPTIMEKUMA_NAME                = var.UPTIMEKUMA_NAME
        UPTIMEKUMA_USER                = var.UPTIMEKUMA_USER
        UPTIMEKUMA_PASSWORD            = var.UPTIMEKUMA_PASSWORD
        LISTMONK_NAME                  = var.LISTMONK_NAME
        LISTMONK_USER                  = var.LISTMONK_USER
        LISTMONK_PASSWORD              = var.LISTMONK_PASSWORD
        FREESCOUT_NAME                 = var.FREESCOUT_NAME
        FREESCOUT_PASSWORD             = var.FREESCOUT_PASSWORD
        FREESCOUT_TZ                   = var.FREESCOUT_TZ
        RUSTDESK_NAME                  = var.RUSTDESK_NAME
        RUSTDESK_USER                  = var.RUSTDESK_USER
        RUSTDESK_PASSWORD              = var.RUSTDESK_PASSWORD
        STIRLINGPDF_NAME               = var.STIRLINGPDF_NAME
        STIRLINGPDF_LANG               = var.STIRLINGPDF_LANG
      }
      DEVELOPMENT = {
        RABBITMQ_NAME                  = var.RABBITMQ_NAME
        RABBITMQ_USER                  = var.RABBITMQ_USER
        RABBITMQ_PASSWORD              = var.RABBITMQ_PASSWORD
        HARBOR_NAME                    = var.HARBOR_NAME
        HARBOR_USER                    = var.HARBOR_USER
        HARBOR_PASSWORD                = var.HARBOR_PASSWORD
        HARBOR_HTTP_SECRET             = var.HARBOR_HTTP_SECRET
        HARBOR_CORE_SECRET             = var.HARBOR_CORE_SECRET
        HARBOR_JOBSERVICE_SECRET       = var.HARBOR_JOBSERVICE_SECRET
        GITLAB_NAME                    = var.GITLAB_NAME
        GITLAB_USER                    = var.GITLAB_USER
        GITLAB_PASSWORD                = var.GITLAB_PASSWORD
        GITLAB_KEY_DB                  = var.GITLAB_KEY_DB
        GITLAB_KEY_SECRET              = var.GITLAB_KEY_SECRET
        GITLAB_KEY_OTP                 = var.GITLAB_KEY_OTP
        GITLAB_TZ                      = var.GITLAB_TZ
        CODESERVER_NAME                = var.CODESERVER_NAME
        CODESERVER_USER                = var.CODESERVER_USER
        CODESERVER_PASSWORD            = var.CODESERVER_PASSWORD
        CODESERVER_TZ                  = var.CODESERVER_TZ
        JENKINS_NAME                   = var.JENKINS_NAME
        JENKINS_USER                   = var.JENKINS_USER
        JENKINS_PASSWORD               = var.JENKINS_PASSWORD
      }
      HACK = {
        PHONEINFOGA_NAME               = var.PHONEINFOGA_NAME
        PHONEINFOGA_NUMVERIFY_API_KEY  = var.PHONEINFOGA_NUMVERIFY_API_KEY
        PHONEINFOGA_GOOGLE_CSE_CX      = var.PHONEINFOGA_GOOGLE_CSE_CX
        PHONEINFOGA_GOOGLE_API_KEY     = var.PHONEINFOGA_GOOGLE_API_KEY
        SHERLOCK_NAME                  = var.SHERLOCK_NAME
        STORMBREAKER_NAME              = var.STORMBREAKER_NAME
        STORMBREAKER_USER              = var.STORMBREAKER_USER
        STORMBREAKER_PASSWORD          = var.STORMBREAKER_PASSWORD
        STORMBREAKER_NGROK_API_KEY     = var.STORMBREAKER_NGROK_API_KEY
        SOFTETHER_NAME                 = var.SOFTETHER_NAME
        BEEF_NAME                      = var.BEEF_NAME
        BEEF_USER                      = var.BEEF_USER
        BEEF_PASSWORD                  = var.BEEF_PASSWORD
        HACK_NAME                      = var.HACK_NAME
      }
      OS = {
        UBUNTU_NAME                    = var.UBUNTU_NAME
        KALI_NAME                      = var.KALI_NAME
        PUTER_NAME                     = var.PUTER_NAME
      }
      AI = {
        OLLAMA_NAME                    = var.OLLAMA_NAME
        CHATGPT_NAME                   = var.CHATGPT_NAME
      }
      SMTP = {
        SMTP_HOST                      = var.SMTP_HOST
        SMTP_SECURITY                  = var.SMTP_SECURITY
        SMTP_STARTTLS                  = var.SMTP_STARTTLS
        SMTP_PORT                      = var.SMTP_PORT
        SMTP_USERNAME                  = var.SMTP_USERNAME
        SMTP_PASSWORD                  = var.SMTP_PASSWORD
        IMAP_HOST                      = var.IMAP_HOST
        IMAP_PORT                      = var.IMAP_PORT
        IMAP_SSL                       = var.IMAP_SSL
        IMAP_STARTTLS                  = var.IMAP_STARTTLS
        IMAP_USERNAME                  = var.IMAP_USERNAME
        IMAP_PASSWORD                  = var.IMAP_PASSWORD
      }
      OWN = {
        CHECKMAIL_BACK_NAME            = var.CHECKMAIL_BACK_NAME
      }
    }
  }
}

# output "VARS" {
#   value = local.VARS
# }

# 🌐 WORKSPACE
variable "PREFIX" {
  type = string
  description = "Define a prefix. This normally is the name of a customer and will be part of the subdomain"
}
variable "PROVIDER" {
  type = string
  description = "Define a provider to use (kind, digo, vult, civo, lino, goog, azur, amws)"
}
variable "ENVIRONMENT" {
  type = string
  description = "Define your environment. (dev, prd)"
}
variable "REGION" {
  type = string
  description = "Define your region. This option is provider specific"
}
variable "HOST" {
  type = string
  description = "Define your hostname"
}
variable "OSTYPE" {
  type = string
  description = "Define your host Operating System"
}
variable "COT" {
  type = string
  description = "Define your Container Tool"
}

# 💾 PATHS
variable "PATH"                           { type = string }
variable "PATH_HOME"                      { type = string }
variable "PATH_MAIN"                      { type = string }
variable "PATH_APP"                       { type = string }
variable "PATH_CLI"                       { type = string }
variable "PATH_HELP"                      { type = string }
variable "PATH_SERVICES"                  { type = string }
variable "PATH_TERRAFORM"                 { type = string }

# 🔢 CONSTANTS
# OS
variable "OSTYPE_LINUX"                   { type = string }
variable "OSTYPE_WINDOWS"                 { type = string }
# CONTAINER
variable "COT_DOCKER"                     { type = string }
variable "COT_PODMAN"                     { type = string }
# PREFIX
variable "PREFIX_NONE"                    { type = string }
variable "PREFIX_CTRL"                    { type = string }
# PROVIDER
variable "PROVIDER_KIND"                  { type = string }
variable "PROVIDER_DIGO"                  { type = string }
variable "PROVIDER_VULT"                  { type = string }
variable "PROVIDER_CIVO"                  { type = string }
variable "PROVIDER_LINO"                  { type = string }
variable "PROVIDER_GOOG"                  { type = string }
variable "PROVIDER_AZUR"                  { type = string }
variable "PROVIDER_AMWS"                  { type = string }
# ENVIRONMENT
variable "ENVIRONMENT_DEV"                { type = string }
variable "ENVIRONMENT_PRD"                { type = string }
# REGION
variable "REGION_NONE"                    { type = string }
# HOST
variable "HOST_EXAMPLE"                   { type = string }
variable "HOST_SPIKYSPAM"                 { type = string }

# 🆚 VERSIONS
# APP
variable "VERSION_APP_CHECKMAIL_BACK"     { type = string }
# CLI
variable "VERSION_CLI_GITLEAKS"           { type = string }
variable "VERSION_CLI_HELM"               { type = string }
variable "VERSION_CLI_JQ"                 { type = string }
variable "VERSION_CLI_K6"                 { type = string }
variable "VERSION_CLI_K9S"                { type = string }
variable "VERSION_CLI_KIND"               { type = string }
variable "VERSION_CLI_KUBECTL"            { type = string }
variable "VERSION_CLI_LYCHEE"             { type = string }
variable "VERSION_CLI_PODMAN"             { type = string }
variable "VERSION_CLI_POPEYE"             { type = string }
variable "VERSION_CLI_STEP"               { type = string }
variable "VERSION_CLI_TERRAFORM"          { type = string }
# CLUSTER
variable "VERSION_CLUSTER_KIND"           { type = string }
variable "VERSION_CLUSTER_DO"             { type = string }
variable "VERSION_CLUSTER_VULTR"          { type = string }
variable "VERSION_CLUSTER_CIVO"           { type = string }
variable "VERSION_CLUSTER_LINODE"         { type = string }
variable "VERSION_CLUSTER_GOOGLE"         { type = string }
variable "VERSION_CLUSTER_AZURE"          { type = string }
variable "VERSION_CLUSTER_AWS"            { type = string }
# DOCKER
variable "VERSION_DOCKER_NGINX"           { type = string }
variable "VERSION_DOCKER_NPM"             { type = string }
variable "VERSION_DOCKER_TRAEFIK"         { type = string }
variable "VERSION_DOCKER_CASSANDRA"       { type = string }
variable "VERSION_DOCKER_CASSANDRA_WEB"   { type = string }
variable "VERSION_DOCKER_POSTGRES"        { type = string }
variable "VERSION_DOCKER_MYSQL"           { type = string }
variable "VERSION_DOCKER_MARIADB"         { type = string }
variable "VERSION_DOCKER_MONGODB"         { type = string }
variable "VERSION_DOCKER_MONGODB_EXPRESS" { type = string }
variable "VERSION_DOCKER_REDIS"           { type = string }
variable "VERSION_DOCKER_PROMETHEUS"      { type = string }
variable "VERSION_DOCKER_ELASTICSEARCH"   { type = string }
variable "VERSION_DOCKER_KIBANA"          { type = string }
variable "VERSION_DOCKER_GRAFANA"         { type = string }
variable "VERSION_DOCKER_PGADMIN"         { type = string }
variable "VERSION_DOCKER_PHPMYADMIN"      { type = string }
variable "VERSION_DOCKER_VAULT"           { type = string }
variable "VERSION_DOCKER_VAULTWARDEN"     { type = string }
variable "VERSION_DOCKER_KEYCLOAK"        { type = string }
variable "VERSION_DOCKER_TWINGATE"        { type = string }
variable "VERSION_DOCKER_GUACD"           { type = string }
variable "VERSION_DOCKER_GUACAMOLE"       { type = string }
variable "VERSION_DOCKER_PIHOLE"          { type = string }
variable "VERSION_DOCKER_FILEBROWSER"     { type = string }
variable "VERSION_DOCKER_KUTT"            { type = string }
variable "VERSION_DOCKER_SEARXNG"         { type = string }
variable "VERSION_DOCKER_DASHY"           { type = string }
variable "VERSION_DOCKER_UPTIMEKUMA"      { type = string }
variable "VERSION_DOCKER_LISTMONK"        { type = string }
variable "VERSION_DOCKER_FREESCOUT"       { type = string }
variable "VERSION_DOCKER_RUSTDESK"        { type = string }
variable "VERSION_DOCKER_STIRLINGPDF"     { type = string }
variable "VERSION_DOCKER_RABBITMQ"        { type = string }
variable "VERSION_DOCKER_HARBOR"          { type = string }
variable "VERSION_DOCKER_GITLAB"          { type = string }
variable "VERSION_DOCKER_CODESERVER"      { type = string }
variable "VERSION_DOCKER_JENKINS"         { type = string }
variable "VERSION_DOCKER_PHONEINFOGA"     { type = string }
variable "VERSION_DOCKER_SOFTETHER"       { type = string }
variable "VERSION_DOCKER_BEEF"            { type = string }
variable "VERSION_DOCKER_UBUNTU"          { type = string }
variable "VERSION_DOCKER_KALI"            { type = string }
variable "VERSION_DOCKER_RUBY"            { type = string }
variable "VERSION_DOCKER_PYTHON"          { type = string }
variable "VERSION_DOCKER_PUTER"           { type = string }
variable "VERSION_DOCKER_OLLAMA"          { type = string }
# HELM
# TERRAFORM
variable "VERSION_TF_KIND"                { type = string }
variable "VERSION_TF_DOCKER"              { type = string }

# 🛟 PORTS
# NETWORK
variable "NGINX_PORT_INT"                 { type = number }
variable "NGINX_PORT_EXT"                 { type = number }
# DATABASES
variable "CASSANDRA_PORT_INT"             { type = number }
variable "CASSANDRA_PORT_EXT"             { type = number }
variable "CASSANDRA_WEB_PORT_INT"         { type = number }
variable "CASSANDRA_WEB_PORT_EXT"         { type = number }
variable "POSTGRES_PORT_INT"              { type = number }
variable "POSTGRES_PORT_EXT"              { type = number }
variable "MYSQL_PORT_INT"                 { type = number }
variable "MYSQL_PORT_EXT"                 { type = number }
variable "MARIADB_PORT_INT"               { type = number }
variable "MARIADB_PORT_EXT"               { type = number }
variable "MONGODB_PORT_INT"               { type = number }
variable "MONGODB_PORT_EXT"               { type = number }
variable "REDIS_PORT_INT"                 { type = number }
variable "REDIS_PORT_EXT"                 { type = number }
variable "PROMETHEUS_PORT_INT"            { type = number }
variable "PROMETHEUS_PORT_EXT"            { type = number }
variable "ELASTICSEARCH_PORT_INT"         { type = number }
variable "ELASTICSEARCH_PORT_EXT"         { type = number }
variable "KIBANA_PORT_INT"                { type = number }
variable "KIBANA_PORT_EXT"                { type = number }
variable "GRAFANA_PORT_INT"               { type = number }
variable "GRAFANA_PORT_EXT"               { type = number }
variable "PGADMIN_PORT_INT"               { type = number }
variable "PGADMIN_PORT_EXT"               { type = number }
variable "PHPMYADMIN_PORT_INT"            { type = number }
variable "PHPMYADMIN_PORT_EXT"            { type = number }
# SECURITY
variable "VAULT_PORT_INT"                 { type = number }
variable "VAULT_PORT_EXT"                 { type = number }
variable "VAULTWARDEN_PORT_INT"           { type = number }
variable "VAULTWARDEN_PORT_EXT"           { type = number }
variable "KEYCLOAK_PORT_INT"              { type = number }
variable "KEYCLOAK_PORT_EXT"              { type = number }
variable "GUACD_PORT_INT"                 { type = number }
variable "GUACD_PORT_EXT"                 { type = number }
variable "GUACAMOLE_PORT_INT"             { type = number }
variable "GUACAMOLE_PORT_EXT"             { type = number }
variable "PIHOLE_PORT_INT_53"             { type = number }
variable "PIHOLE_PORT_EXT_53"             { type = number }
variable "PIHOLE_PORT_INT_67"             { type = number }
variable "PIHOLE_PORT_EXT_67"             { type = number }
variable "PIHOLE_PORT_INT_80"             { type = number }
variable "PIHOLE_PORT_EXT_80"             { type = number }
variable "TRAEFIK_PORT_INT_80"            { type = number }
variable "TRAEFIK_PORT_EXT_80"            { type = number }
variable "TRAEFIK_PORT_INT_443"           { type = number }
variable "TRAEFIK_PORT_EXT_443"           { type = number }
variable "TRAEFIK_PORT_INT_8080"          { type = number }
variable "TRAEFIK_PORT_EXT_8080"          { type = number }
# TOOLS
variable "FILEBROWSER_PORT_INT"           { type = number }
variable "FILEBROWSER_PORT_EXT"           { type = number }
variable "KUTT_PORT_INT"                  { type = number }
variable "KUTT_PORT_EXT"                  { type = number }
variable "SEARXNG_PORT_INT"               { type = number }
variable "SEARXNG_PORT_EXT"               { type = number }
variable "DASHY_PORT_INT"                 { type = number }
variable "DASHY_PORT_EXT"                 { type = number }
variable "UPTIMEKUMA_PORT_INT"            { type = number }
variable "UPTIMEKUMA_PORT_EXT"            { type = number }
variable "LISTMONK_PORT_INT"              { type = number }
variable "LISTMONK_PORT_EXT"              { type = number }
variable "FREESCOUT_PORT_INT"             { type = number }
variable "FREESCOUT_PORT_EXT"             { type = number }
variable "RUSTDESK_SIGNAL_PORT_INT_21114" { type = number }
variable "RUSTDESK_SIGNAL_PORT_EXT_21114" { type = number }
variable "RUSTDESK_SIGNAL_PORT_INT_21115" { type = number }
variable "RUSTDESK_SIGNAL_PORT_EXT_21115" { type = number }
variable "RUSTDESK_SIGNAL_PORT_INT_21116" { type = number }
variable "RUSTDESK_SIGNAL_PORT_EXT_21116" { type = number }
variable "RUSTDESK_SIGNAL_PORT_INT_21118" { type = number }
variable "RUSTDESK_SIGNAL_PORT_EXT_21118" { type = number }
variable "RUSTDESK_RELAY_PORT_INT_21117"  { type = number }
variable "RUSTDESK_RELAY_PORT_EXT_21117"  { type = number }
variable "RUSTDESK_RELAY_PORT_INT_21119"  { type = number }
variable "RUSTDESK_RELAY_PORT_EXT_21119"  { type = number }
variable "STIRLINGPDF_PORT_INT"           { type = number }
variable "STIRLINGPDF_PORT_EXT"           { type = number }
# DEVELOPMENT
variable "RABBITMQ_PORT_INT_NODE"         { type = number }
variable "RABBITMQ_PORT_EXT_NODE"         { type = number }
variable "RABBITMQ_PORT_INT_DIST"         { type = number }
variable "RABBITMQ_PORT_EXT_DIST"         { type = number }
variable "HARBOR_PORT_INT"                { type = number }
variable "HARBOR_PORT_EXT"                { type = number }
variable "HARBOR_PORT_INT_REGISTRY"       { type = number }
variable "HARBOR_PORT_EXT_REGISTRY"       { type = number }
variable "GITLAB_PORT_INT_80"             { type = number }
variable "GITLAB_PORT_EXT_80"             { type = number }
variable "GITLAB_PORT_INT_443"            { type = number }
variable "GITLAB_PORT_EXT_443"            { type = number }
variable "GITLAB_PORT_INT_22"             { type = number }
variable "GITLAB_PORT_EXT_22"             { type = number }
variable "CODESERVER_PORT_INT"            { type = number }
variable "CODESERVER_PORT_EXT"            { type = number }
variable "JENKINS_PORT_INT"               { type = number }
variable "JENKINS_PORT_EXT"               { type = number }
variable "JENKINS_PORT_INT_50000"         { type = number }
variable "JENKINS_PORT_EXT_50000"         { type = number }
# OPERATING SYSTEM
variable "PUTER_PORT_INT"                 { type = number }
variable "PUTER_PORT_EXT"                 { type = number }
# HACK
variable "PHONEINFOGA_PORT_INT"           { type = number }
variable "PHONEINFOGA_PORT_EXT"           { type = number }
variable "STORMBREAKER_PORT_INT"          { type = number }
variable "STORMBREAKER_PORT_EXT"          { type = number }
variable "SOFTETHER_PORT_INT_443"         { type = number }
variable "SOFTETHER_PORT_EXT_443"         { type = number }
variable "SOFTETHER_PORT_INT_5555"        { type = number }
variable "SOFTETHER_PORT_EXT_5555"        { type = number }
variable "SOFTETHER_PORT_INT_992"         { type = number }
variable "SOFTETHER_PORT_EXT_992"         { type = number }
variable "SOFTETHER_PORT_INT_500"         { type = number }
variable "SOFTETHER_PORT_EXT_500"         { type = number }
variable "SOFTETHER_PORT_INT_4500"        { type = number }
variable "SOFTETHER_PORT_EXT_4500"        { type = number }
variable "SOFTETHER_PORT_INT_1701"        { type = number }
variable "SOFTETHER_PORT_EXT_1701"        { type = number }
variable "SOFTETHER_PORT_INT_1194"        { type = number }
variable "SOFTETHER_PORT_EXT_1194"        { type = number }
variable "BEEF_PORT_INT_3000"             { type = number }
variable "BEEF_PORT_EXT_3000"             { type = number }
variable "BEEF_PORT_INT_6789"             { type = number }
variable "BEEF_PORT_EXT_6789"             { type = number }
variable "BEEF_PORT_INT_61985"            { type = number }
variable "BEEF_PORT_EXT_61985"            { type = number }
variable "BEEF_PORT_INT_61986"            { type = number }
variable "BEEF_PORT_EXT_61986"            { type = number }
# AI
variable "CHATGPT_PORT_INT"               { type = number }
variable "CHATGPT_PORT_EXT"               { type = number }
# OWN APPS
variable "CHECKMAIL_BACK_PORT_80_INT"     { type = number }
variable "CHECKMAIL_BACK_PORT_80_EXT"     { type = number }
variable "CHECKMAIL_BACK_PORT_443_INT"    { type = number }
variable "CHECKMAIL_BACK_PORT_443_EXT"    { type = number }

# 🔐 SECRETS
# JWT
variable "JWT_ISSUER"                     { type = string }
variable "JWT_AUDIENCE"                   { type = string }
variable "JWT_SECRET"                     { type = string }
variable "JWT_TIME"                       { type = string }
# PROVIDERS
variable "GITHUB_NAME"                    { type = string }
variable "GITHUB_USER"                    { type = string }
variable "GITHUB_EMAIL"                   { type = string }
variable "GOOGLE_TEXTTOSPEECH_API_KEY"    { type = string }
# NETWORK
variable "NGINX_NAME"                     { type = string }
variable "NPM_NAME"                       { type = string }
variable "NPM_USER"                       { type = string }
variable "NPM_PASSWORD"                   { type = string }
variable "TRAEFIK_NAME"                   { type = string }
variable "TRAEFIK_USER"                   { type = string }
variable "TRAEFIK_PASSWORD"               { type = string }
variable "MAILINABOX_DOMAIN"              { type = string }
variable "MAILINABOX_USER"                { type = string }
variable "MAILINABOX_PASSWORD"            { type = string }
# DATABASES
variable "CASSANDRA_NAME"                 { type = string }
variable "CASSANDRA_USER"                 { type = string }
variable "CASSANDRA_PASSWORD"             { type = string }
variable "POSTGRES_NAME"                  { type = string }
variable "POSTGRES_USER"                  { type = string }
variable "POSTGRES_PASSWORD"              { type = string }
variable "MYSQL_NAME"                     { type = string }
variable "MYSQL_USER"                     { type = string }
variable "MYSQL_PASSWORD"                 { type = string }
variable "MARIADB_NAME"                   { type = string }
variable "MARIADB_USER"                   { type = string }
variable "MARIADB_PASSWORD"               { type = string }
variable "MONGODB_NAME"                   { type = string }
variable "MONGODB_USER"                   { type = string }
variable "MONGODB_PASSWORD"               { type = string }
variable "REDIS_NAME"                     { type = string }
variable "REDIS_USER"                     { type = string }
variable "REDIS_PASSWORD"                 { type = string }
variable "PROMETHEUS_NAME"                { type = string }
variable "PROMETHEUS_USER"                { type = string }
variable "PROMETHEUS_PASSWORD"            { type = string }
variable "ELASTICSEARCH_NAME"             { type = string }
variable "ELASTICSEARCH_USER"             { type = string }
variable "ELASTICSEARCH_PASSWORD"         { type = string }
variable "KIBANA_NAME"                    { type = string }
variable "GRAFANA_NAME"                   { type = string }
variable "GRAFANA_USER"                   { type = string }
variable "GRAFANA_PASSWORD"               { type = string }
variable "PGADMIN_NAME"                   { type = string }
variable "PGADMIN_USER"                   { type = string }
variable "PGADMIN_PASSWORD"               { type = string }
variable "PHPMYADMIN_NAME"                { type = string }
# SECURITY
variable "VAULT_NAME"                     { type = string }
variable "VAULT_TOKEN_ROOT"               { type = string }
variable "VAULT_TOKEN_USER"               { type = string }
variable "VAULTWARDEN_NAME"               { type = string }
variable "VAULTWARDEN_DOMAIN"             { type = string }
variable "VAULTWARDEN_ADMIN_PASSWORD"     { type = string }
variable "VAULTWARDEN_ADMIN_TOKEN"        { type = string }
variable "KEYCLOAK_NAME"                  { type = string }
variable "KEYCLOAK_USER"                  { type = string }
variable "KEYCLOAK_PASSWORD"              { type = string }
variable "TWINGATE_NAME"                  { type = string }
variable "TWINGATE_DOMAIN"                { type = string }
variable "TWINGATE_TENANT_NETWORK"        { type = string }
variable "TWINGATE_ACCESS_TOKEN"          { type = string }
variable "TWINGATE_REFRESH_TOKEN"         { type = string }
variable "TWINGATE_LABEL_HOSTNAME"        { type = string }
variable "GUACD_NAME"                     { type = string }
variable "GUACAMOLE_NAME"                 { type = string }
variable "GUACAMOLE_USER"                 { type = string }
variable "GUACAMOLE_PASSWORD"             { type = string }
variable "PIHOLE_NAME"                    { type = string }
variable "PIHOLE_PASSWORD"                { type = string }
variable "PIHOLE_TZ"                      { type = string }
# TOOLS
variable "FILEBROWSER_NAME"               { type = string }
variable "FILEBROWSER_USER"               { type = string }
variable "FILEBROWSER_PASSWORD"           { type = string }
variable "KUTT_NAME"                      { type = string }
variable "KUTT_PASSWORD"                  { type = string }
variable "SEARXNG_NAME"                   { type = string }
variable "DASHY_NAME"                     { type = string }
variable "UPTIMEKUMA_NAME"                { type = string }
variable "UPTIMEKUMA_USER"                { type = string }
variable "UPTIMEKUMA_PASSWORD"            { type = string }
variable "LISTMONK_NAME"                  { type = string }
variable "LISTMONK_USER"                  { type = string }
variable "LISTMONK_PASSWORD"              { type = string }
variable "FREESCOUT_NAME"                 { type = string }
variable "FREESCOUT_PASSWORD"             { type = string }
variable "FREESCOUT_TZ"                   { type = string }
variable "RUSTDESK_NAME"                  { type = string }
variable "RUSTDESK_USER"                  { type = string }
variable "RUSTDESK_PASSWORD"              { type = string }
variable "STIRLINGPDF_NAME"               { type = string }
variable "STIRLINGPDF_LANG"               { type = string }
# DEVELOPMENT
variable "RABBITMQ_NAME"                  { type = string }
variable "RABBITMQ_USER"                  { type = string }
variable "RABBITMQ_PASSWORD"              { type = string }
variable "HARBOR_NAME"                    { type = string }
variable "HARBOR_USER"                    { type = string }
variable "HARBOR_PASSWORD"                { type = string }
variable "HARBOR_HTTP_SECRET"             { type = string }
variable "HARBOR_CORE_SECRET"             { type = string }
variable "HARBOR_JOBSERVICE_SECRET"       { type = string }
variable "GITLAB_NAME"                    { type = string }
variable "GITLAB_USER"                    { type = string }
variable "GITLAB_PASSWORD"                { type = string }
variable "GITLAB_KEY_DB"                  { type = string }
variable "GITLAB_KEY_SECRET"              { type = string }
variable "GITLAB_KEY_OTP"                 { type = string }
variable "GITLAB_TZ"                      { type = string }
variable "CODESERVER_NAME"                { type = string }
variable "CODESERVER_USER"                { type = string }
variable "CODESERVER_PASSWORD"            { type = string }
variable "CODESERVER_TZ"                  { type = string }
variable "JENKINS_NAME"                   { type = string }
variable "JENKINS_USER"                   { type = string }
variable "JENKINS_PASSWORD"               { type = string }
# HACK
variable "PHONEINFOGA_NAME"               { type = string }
variable "PHONEINFOGA_NUMVERIFY_API_KEY"  { type = string }
variable "PHONEINFOGA_GOOGLE_CSE_CX"      { type = string }
variable "PHONEINFOGA_GOOGLE_API_KEY"     { type = string }
variable "SHERLOCK_NAME"                  { type = string }
variable "STORMBREAKER_NAME"              { type = string }
variable "STORMBREAKER_USER"              { type = string }
variable "STORMBREAKER_PASSWORD"          { type = string }
variable "STORMBREAKER_NGROK_API_KEY"     { type = string }
variable "SOFTETHER_NAME"                 { type = string }
variable "BEEF_NAME"                      { type = string }
variable "BEEF_USER"                      { type = string }
variable "BEEF_PASSWORD"                  { type = string }
variable "HACK_NAME"                      { type = string }
# OPERATING SYSTEM
variable "UBUNTU_NAME"                    { type = string }
variable "KALI_NAME"                      { type = string }
variable "PUTER_NAME"                     { type = string }
# AI
variable "OLLAMA_NAME"                    { type = string }
variable "CHATGPT_NAME"                   { type = string }
# SMTP
variable "SMTP_HOST"                      { type = string }
variable "SMTP_SECURITY"                  { type = string }
variable "SMTP_STARTTLS"                  { type = bool }
variable "SMTP_PORT"                      { type = number }
variable "SMTP_USERNAME"                  { type = string }
variable "SMTP_PASSWORD"                  { type = string }
variable "IMAP_HOST"                      { type = string }
variable "IMAP_PORT"                      { type = number }
variable "IMAP_SSL"                       { type = bool }
variable "IMAP_STARTTLS"                  { type = bool }
variable "IMAP_USERNAME"                  { type = string }
variable "IMAP_PASSWORD"                  { type = string }
# OWN APPS
variable "CHECKMAIL_BACK_NAME"            { type = string }


