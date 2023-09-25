#!/bin/bash

sed -i "s/passwd: \"beef\"/passwd: \"$BEEF_PASSWORD\"/" config.yaml
sed -i "s/user:   \"beef\"/user: \"$BEEF_USER\"/" config.yaml

if [ "$BEEF_DEBUG" == "true" ]; then
    sed -i "s/debug: false/debug: true/" config.yaml
fi

if [ "$BEEF_SSL" == "true" ]; then
    ./generate-certificate
    sed -i '1N;$!N;s/https:\n\s\{1,\}enable:\sfalse/https:\n            enable: true/g;P;D' config.yaml
fi

if [ "$BEEF_SSL_PUBLIC" == "true" ]; then
    sed -i "s/public_enabled: false/public_enabled: true/" config.yaml
    sed -i "s/# public:/public:/" config.yaml
    sed -i "s/#     https: false/     https: true/" config.yaml
fi

if [ -n "$BEEF_PUBLIC_IP" ]; then
    sed -i "s/allow_reverse_proxy: false/allow_reverse_proxy: true/" config.yaml
    sed -i "s/# public:/public:/" config.yaml
    sed -i "s/#     host: \"\"/     host: \"$BEEF_PUBLIC_IP\"/" config.yaml
    sed -i "s/#     port: \"\"/     port: \"$BEEF_PUBLIC_PORT\"/" config.yaml
fi

if [ "$BEEF_MSF_ENABLE" == "true" ]; then
    sed -i '1N;$!N;s/metasploit:\n\s\{1,\}enable:\sfalse/metasploit:\n            enable: true/g;P;D' config.yaml
    sed -i "s/ host: \"127.0.0.1\"/ host: \"$MSF_RPC_HOST\"/" extensions/metasploit/config.yaml
    sed -i "s/port: 55552/port: $MSF_RPC_PORT/" extensions/metasploit/config.yaml
    sed -i "s/user: \"msf\"/user: \"$MSF_RPC_USER\"/" extensions/metasploit/config.yaml
    sed -i "s/pass: \"abc123\"/pass: \"$MSF_RPC_PASS\"/" extensions/metasploit/config.yaml
    sed -i "s/callback_host: \"127.0.0.1\"/callback_host: \"$MSF_CALLBACK_HOST\"/" extensions/metasploit/config.yaml
    sed -i "s/ssl: true/ssl: $MSF_RPC_SSL/" extensions/metasploit/config.yaml
    sed -i "s/ssl_verify: true/ssl_verify: $MSF_SSL_VERIFY/" extensions/metasploit/config.yaml
fi

if [ "$BEEF_SE_ENABLE" == "true" ]; then
    sed -i '1N;$!N;s/social_engineering:\n\s\{1,\}enable:\sfalse/social_engineering:\n            enable: true/g;P;D' config.yaml
    sed -i "s/msf_reverse_handler_host: \"172.16.45.1\"/msf_reverse_handler_host: \"$SE_POSH_HOST\"/" extensions/social_engineering/config.yaml
    sed -i "s/msf_reverse_handler_port: \"443\"/msf_reverse_handler_port: \"$SE_POSH_PORT\"/" extensions/social_engineering/config.yaml
fi

if [ "$BEEF_EMAIL_ENABLE" == "true" ]; then
    sed -i '1N;$!N;s/notifications:\n\s\{1,\}enable:\sfalse/notifications:\n            enable: true/g;P;D' extensions/notifications/config.yaml
    sed -i '1N;$!N;s/email:\n\s\{1,\}enable:\sfalse/email:\n              enable: true/g;P;D' extensions/notifications/config.yaml
    sed -i "s/from_address: sender_email_address/from_address: $BEEF_EMAIL_FROM/" extensions/notifications/config.yaml
    sed -i "s/to_address: receipient_email_address/to_address: $BEEF_EMAIL_TO/" extensions/notifications/config.yaml
    sed -i "s/smtp_host: 127.0.0.1/smtp_host: $BEEF_EMAIL_HOST/" extensions/notifications/config.yaml
    sed -i "s/smtp_port: 25/smtp_port: $BEEF_EMAIL_PORT/" extensions/notifications/config.yaml
fi

if [ "$BEEF_PHISHINGFRENZY_ENABLE" == "true" ]; then
    sed -i '1N;$!N;s/phishing_frenzy:\n\s\{1,\}enable:\sfalse/phishing_frenzy:\n            enable: true/g;P;D' config.yaml
fi

sleep $BEEF_WAITTIME
exec ./beef
