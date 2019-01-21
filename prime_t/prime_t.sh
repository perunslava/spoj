#!/bin/env bash

TEST_NUMBERS=0
NUMBER=0
COUNTER=0
SCRIPT_NAME=''
HOST_NAME=''
DEBUG=""

###

function log_debug {
    local caller="${1}"
    local var_name="${2}"
    local msg="${3}"

    echo "DEBUG: [ ${caller} ] - ${var_name} >>${msg}<<"
}

function log_msg {
    local caller="${1}"
    local msg="${2}"

    echo "[ ${caller} ] ${msg}"
}


function _config {
    ### _config - set variables

    ### global variables
    # kiss - one locale, one commands output
    #DEBUG="True"
    DEBUG="False"
    export LANG='en_US.UTF-8'
    HOST_NAME=$(hostname -s)
    export HOST_NAME


    # local variables
    local log_func="${FUNCNAME[0]}"
    
    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "HOST_NAME" "${HOST_NAME}"; fi
    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "TEST_NUMBERS" "${TEST_NUMBERS}"; fi
    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "COUNTER" "${COUNTER}"; fi
    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "NUMBER" "${NUMBER}"; fi
}

function init {
    # check dirs, download data, generate intermediate information, etc.
  
    _config

    # local variables
    local log_func="${FUNCNAME[0]}"

}


function is_prime {

    # local variables
    local log_func="${FUNCNAME[0]}"
    local n=${1}
    local end=$((${n} / 2))

    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "n" "${n}"; fi
    if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "end" "${end}"; fi

    if [[ ${n} < 2 ]]; then return 1; fi
    for divisor in $(seq 2 ${end})
    do
        if [[ "${DEBUG}" == 'True' ]]; then log_debug "${log_func}" "divisor" "${divisor}"; fi
        mod=$((${n} % ${divisor}))
        if [[ ${mod} -eq 0 ]]; then return 1; fi
    done
    return 0
}




## main - allowed flag combinations
init

read TEST_NUMBERS
COUNTER=1
if [[ "${DEBUG}" == 'True' ]]; then log_debug "main" "TEST_NUMBERS" "${TEST_NUMBERS}"; fi
if [[ "${DEBUG}" == 'True' ]]; then log_debug "main" "COUNTER" "${COUNTER}"; fi

while [[ ${COUNTER} -le ${TEST_NUMBERS} ]]
do
  read NUMBER
  if [[ "${DEBUG}" == 'True' ]]; then log_debug "main" "NUMBER" "${NUMBER}"; fi
  is_prime ${NUMBER}
  if [[ "$?" -ne 0 ]]
  then
    echo 'NIE'
  else
    echo 'TAK'
  fi
  COUNTER=$((${COUNTER} + 1))
done

