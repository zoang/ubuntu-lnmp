#!/bin/bash

COMMON_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source ${COMMON_DIR}/ansi.sh

export LOG_PATH=/var/log/wsl-ubuntu.log

function call_function {
    func=$1
    desc=$2
    log_file=$3
    echo -n " ${desc}..."
    $func >> ${log_file} 2>&1
    ret=$?    
    echo -n    [  
    if [[ $ret -eq 0 ]]; then
        ansi  -n --green OK
    else
        ansi  -n --red ERR
    fi 
    echo  ]
}

random_string(){
    length=${1:-32}
    echo `cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${length} | head -n 1`
}
