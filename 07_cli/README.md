![CLI Logo](_assets/images/cli.png)
# 07. CLI Tools

![CLI Banner](_assets/images/cli_banner.png)

In this Tutorial we are going to prepare our **`cli.sh`** script, to download all necessary **CLI** tools from **GitHub**. The amount of tools will grow and will be added to that script.

## Video

In this video I demonstrate how I prepared our **`cli.sh`** script, to download all necessary **CLI** tools from **GitHub**.

[![Video](_assets/images/cli_video.png)](https://youtu.be/L6_Wc0MdsP8)

## Links

- [Gitleaks](https://github.com/gitleaks/gitleaks)
- [Helm](https://github.com/helm/helm)
- [JQ](https://github.com/jqlang/jq)
- [K6](https://github.com/grafana/k6)
- [Kind](https://github.com/kubernetes-sigs/kind)
- [KubeCtl](https://kubernetes.io/docs/tasks/tools)
- [Lychee](https://github.com/lycheeverse/lychee)
- [Podman](https://github.com/containers/podman)
- [Popeye](https://github.com/derailed/popeye)
- [Step](https://github.com/smallstep/cli)
- [Terraform](https://github.com/hashicorp/terraform)
- 🎺 [Background Music](https://freesound.org/people/Migfus20/sounds/683265)

## Prerequisites

- [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)
- **tar** and **unzip** pre-installed on your machine

## Version Script

- I have defined version **Environment Variables** in **[SS/version/cli/version.sh](../SS/SS/version/cli/version.sh)**

  https://github.com/SpikySpam/Tutorials/blob/5413eca89d98ffad1ebd0ecb2f6625a4ece0ded8/SS/SS/version/cli/version.sh#L1-L11

## The CLI Script

- I have created the script for **Downloading** the **CLI** tools in **[SS/cli.sh](../SS/SS/cli.sh)**.

  https://github.com/SpikySpam/Tutorials/blob/6c2f4e44317764a4db9ecbf57fa0bfad8ded7a02/SS/SS/cli.sh#L1-L262

## Execute the Script

- Add Execution **Privileges** to **`cli.sh`**
  ```bash
  chmod +x $TF_VAR_PATH_MAIN/cli.sh
  ```

- **Execute** the script
  ```bash
  $TF_VAR_PATH_MAIN/cli.sh
  ```

## Calling from **`.bash_profile`**

- I have added a call to the **`cli.sh`** Script in our **[.bash_profile](../SS/.bash_profile_public)** file:
  ```bash
  # .bash_profile snippet

  # ...

  # -- INSTALL CLI TOOLS
  install_cli () {
    chmod +x $TF_VAR_PATH_MAIN/cli.sh
    $TF_VAR_PATH_MAIN/cli.sh
  }
  
  # ...
  
  load_env_vars
  initialize
  install_cli # ⬅️ added
  finalize
  
  export INITIALIZE=false
  ```

## Tool Demos

- [Gitleaks](https://github.com/gitleaks/gitleaks)
  ```bash
  gitleaks detect -v -s $TF_VAR_PATH_MAIN --redact
  ```
- [Helm](https://github.com/helm/helm)
  ```bash
  helm create $TF_VAR_PATH_APP/helm/vaultwarden
  ```
- [JQ](https://github.com/jqlang/jq)
  ```bash
  echo '{"foo": 0}' | jq
  ```
- [K6](https://github.com/grafana/k6)
  ```bash
  k6
  ```
- [Kind](https://github.com/kubernetes-sigs/kind)
  ```bash
  kind create cluster
  # kind delete cluster
  ```
- [KubeCtl](https://kubernetes.io/docs/tasks/tools)
  ```bash
  k cluster-info
  ```
- [Lychee](https://github.com/lycheeverse/lychee)
  ```bash
  lychee . --offline
  ```
- [Podman](https://github.com/containers/podman)
  ```bash
  podman info
  ```
- [Popeye](https://github.com/derailed/popeye)
  ```bash
  popeye
  ```
- [Step](https://github.com/smallstep/cli)
  ```bash
  step base64 $TF_VAR_VAULTWARDEN_ADMIN_TOKEN
  ```
- [Terraform](https://github.com/hashicorp/terraform)
  ```bash
  t workspace list
  ```
