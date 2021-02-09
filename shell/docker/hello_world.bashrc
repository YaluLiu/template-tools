#!/usr/bin/env bash

###############################################################################
# Set Env parameter 
###############################################################################


# CMD 
DOCKER_RUN="docker run -dt"

# workspace in docker,volume host-project_path to docker_root_dir
DOCKER_ROOT_DIR="/home"

# user-name
DOCKER_HUB_USER="353942829"

# image-name
IMAGE_NAME="test"

# container-name docker run -it --name xx
CONTAINER_NAME="spark"

#  color 
BOLD='\033[1m'
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[32m'
WHITE='\033[34m'
YELLOW='\033[33m'
NO_COLOR='\033[0m'

function env() {
  (echo >&2 -e "[${YELLOW} ENV ${NO_COLOR}] $*")
}

function log() {
  (echo >&2 -e "[${GREEN} LOG ${GREEN}${NO_COLOR}]${GREEN} $* ${NO_COLOR}")
}

function ok() {
  (echo >&2 -e "[${GREEN}${BOLD} OK ${NO_COLOR}] $*")
}