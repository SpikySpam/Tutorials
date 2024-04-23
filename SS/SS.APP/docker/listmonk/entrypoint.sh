#!/bin/bash

cat > config.toml <<EOF
[app]
address = "$LISTMONK_NAME:$LISTMONK_PORT_INT"
admin_username = "$LISTMONK_USER"
admin_password = "$LISTMONK_PASSWORD"

[db]
host = "$LISTMONK_NAME-$POSTGRES_NAME"
port = $POSTGRES_PORT_INT
user = "$POSTGRES_USER"
password = "$POSTGRES_PASSWORD"
database = "$LISTMONK_NAME"
ssl_mode = "disable"
max_open = 25
max_idle = 25
max_lifetime = "300s"
params = ""
EOF

yes | ./listmonk --install --config config.toml && ./listmonk --config config.toml