#! /bin/bash

logit(){
    local LOG_LEVEL=$1
    shift
    MSG=$@
    TIME_STAMP=$(date +"%Y-%m-%d %T")
    if [ "$LOG_LEVE"="ERROR" ] || $VERBOSE
    then
        echo "${TIME_STAMP} > $(hostname) : [${LOG_LEVEL}] ${MSG}"
    else
        echo "${TIME_STAMP} | $(hostname) : [${LOG_LEVEL}] ${MSG}"
    fi
}

logit INFO "cheking logger utility"
