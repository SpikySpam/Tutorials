![CLI Logo](_assets/images/cli.png)
# 07. CLI Tools

![CLI Banner](_assets/images/cli_banner.png)

In this Tutorial we are going to prepare our **`cli.sh`** script, to download all necessary **CLI** tools from **GitHub**. The amount of tools will grow and will be added to that script.

## Video

In this video I demonstrate how I prepared our **`cli.sh`** script, to download all necessary **CLI** tools from **GitHub**.

[![Video](_assets/images/cli-video.png)](https://youtu.be/XXXXXXXXXXXXXXXXXXXXXXX)

## Links

- [Lychee GitHub](https://github.com/lycheeverse/lychee)
- [Gitleaks GitHub]( https://github.com/gitleaks/gitleaks)

## Prerequisites

- [**Clone** latest **Sources**](../05_databases/README.md#latest-sources)
- **tar** and **unzip** pre-installed on your machine

## Version Script

- I have defined version **Environment Variables** in **[SS/version/cli/version.sh](../SS/SS/version/cli/version.sh)**
  ```bash
  # version/cli/version.sh snippet

  export TF_VAR_VERSION_CLI_LYCHEE="0.13.0"     # https://github.com/lycheeverse/lychee/releases
  # ... more version variables here
  ```

## The CLI Script

- I have created the script for **Downloading** the **CLI** tools in **[SS/cli.sh](../SS/SS/cli.sh)**.
  ```bash
  # cli.sh snippet

  #!/bin/bash

  OSTYPE_LINUX="linux-gnu"
  OSTYPE_WINDOWS="msys"

  CLI_NAME_LYCHEE="lychee"
  # ... more tools here

  cli_install_lychee() {

    if ! compgen -G "${TF_VAR_PATH_CLI}/$CLI_NAME_LYCHEE*" > /dev/null; then
      if [ $OSTYPE == $OSTYPE_LINUX ]; then
        # Download and Extract for Linux
      elif [ $OSTYPE == $OSTYPE_WINDOWS ]; then
        # Download and Extract for Windows
      fi
      echo -n "⬇ "
    else
      echo -n "√ "
    fi
    [ $INITIALIZE == false ] && echo $CLI_NAME_LYCHEE
    [ $INITIALIZE == false ] && echo -n " "$(gitleaks version)

  }
  # ... more tools here

  echo $DIV
  echo ⬇️ " Downloading CLI tools"
  echo $DIV

  cli_install_lychee
  # ... more tools here
  [ $INITIALIZE != false ] && echo

  ```

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

- I have added a call to the **`cli.sh`** Script in our **`.bash_profile`** file:
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