#!/bin/bash

# Clean Previous
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_CODESERVER_NAME/docker-compose.yaml down
rm -rf $HOME/docker/$TF_VAR_CODESERVER_NAME

# Compose Up
docker compose -f $TF_VAR_PATH_APP/docker/$TF_VAR_CODESERVER_NAME/docker-compose.yaml up -d --wait --build

# Copy local Source to the Code Server workspace-folder
mkdir $HOME/docker/$TF_VAR_CODESERVER_NAME/workspace/Tutorials
cp -a $TF_VAR_PATH $HOME/docker/$TF_VAR_CODESERVER_NAME/workspace/Tutorials
rm -f $HOME/docker/$TF_VAR_CODESERVER_NAME/workspace/Tutorials/SS/SS/CLI/*.exe

# Call the solutions .bash_pofile from .bashrc
cat >> $HOME/docker/$TF_VAR_CODESERVER_NAME/.bashrc <<EOL
export TF_VAR_PATH=\$HOME/workspace/Tutorials/SS
source \$TF_VAR_PATH/.bash_profile
EOL

# Copy the private SSH key to the Code Server .ssh-folder
cp $HOME/.ssh/$TF_VAR_GITHUB_NAME-$TF_VAR_GITHUB_USER $HOME/docker/${TF_VAR_CODESERVER_NAME}/.ssh/$TF_VAR_GITHUB_NAME-$TF_VAR_GITHUB_USER
