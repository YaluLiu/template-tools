#! /bin/bash

###############################################################################
# NAME: Docker Builder
# maintainer: Lyl
###############################################################################

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
source "${PROJECT_DIR}/hello_world.bashrc"

function post_run_setup() {
    docker logs -ft ${CONTAINER_NAME}
    # docker exec -it "${CONTAINER_NAME}" bash
}

function clean_container() {
    docker stop ${CONTAINER_NAME} 
    docker rm ${CONTAINER_NAME}
}


function create_image() {
    cd docker
    if [[ "$(docker images -q ${IMAGE_NAME} 2> /dev/null)" == "" ]]; then
        set -x
        docker pull ${DOCKER_HUB_USER}/${IMAGE_NAME}
        set +x
    else
        log "alreay found ENV_IMAGE:${IMAGE_NAME}."
    fi
    
    cd ..
    
    if [ $? -ne 0 ]; then
        error "Failed to pull ${IMAGE_NAME}!"
        exit 1
    fi
    
}

function check_clean_container(){
    state_run=`docker ps | grep ${CONTAINER_NAME} | grep Up`
    state_stop=`docker ps -a| grep ${CONTAINER_NAME} | grep Exist`
    # echo $state_run  ${#state_run}
    # echo $state_stop ${#state_stop}

    if [[ -n $state_run ]]; then # state is run
        clean_container
    elif [[ -n $state_stop ]]; then # state is stop
        docker rm ${CONTAINER_NAME}
    fi
}

function start_work() {
    check_clean_container
    set -x
    ${DOCKER_RUN} \
        --net=host \
        -v ${PROJECT_DIR}:${DOCKER_ROOT_DIR} \
        --name "${CONTAINER_NAME}" \
        --restart=always \
        "${SPARK_IMAGE}"
    set +x

    if [ $? -ne 0 ]; then
        error "Failed to start docker container \"${CONTAINER_NAME}\" based on image: ${SPARK_IMAGE}"
        exit 1
    fi
    
}


function main() {
    if [ $# != 1 ] ; then
        echo "please input cmd: create or clean or start"
        exit 1;
    elif [ $1 == "create" ]; then
        create_image
    elif [ $1 == "clean" ]; then
        clean_container
    elif [ $1 == "start" ]; then
        create_image
        start_work
    fi
}

main "$@"