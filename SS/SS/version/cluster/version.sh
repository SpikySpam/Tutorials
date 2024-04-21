export TF_VAR_VERSION_CLUSTER_KIND="1.29.2"       # https://hub.docker.com/r/kindest/node/tags
export TF_VAR_VERSION_CLUSTER_DO="1.29.1-do.0"    # doctl kubernetes options versions
export TF_VAR_VERSION_CLUSTER_VULTR="1.29.1+1"    # vultr-cli kubernetes versions
export TF_VAR_VERSION_CLUSTER_CIVO="1.26.4-k3s1"  # civo kubernetes versions ➡️ civo apikey add MAIN_KEY $TF_VAR_CIVO_API_KEY
export TF_VAR_VERSION_CLUSTER_LINODE="1.28"       # docker run --rm -it -e LINODE_CLI_TOKEN=$LINODE_TOKEN linode/cli:latest lke versions-list
export TF_VAR_VERSION_CLUSTER_GOOGLE=""           #
export TF_VAR_VERSION_CLUSTER_AZURE=""            #
export TF_VAR_VERSION_CLUSTER_AWS=""              #
