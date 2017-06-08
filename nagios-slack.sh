#!/bin/bash

HOOK='https://hooks.slack.com/services/some-hook-url'
TEXT=payload="{\"text\": \"${2} ALERT: \nDATE: ${7} \nHOST: ${1} ( ${6} ) \nSTATE: ${4} \nSERVICE: ${3} \nMESSAGE: ${5} <https://mynagios.com/cgi-bin/status.cgi?host=${1} |See me on Nagios>\"}"
curl -X POST --data-urlencode "$TEXT" "${HOOK}"
