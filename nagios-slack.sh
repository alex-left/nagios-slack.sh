#!/bin/bash

HOOK='https://hooks.slack.com/some-url-hook'
TEXT=payload="{\"text\": \"-------------\n${2} ALERT: \nDATE: ${7} \nHOST: ${1} ( ${6} ) \nSTATE: ${4} \nSERVICE: ${3} \nMESSAGE: ${5} <https://mynagios-url.com/cgi-bin/status.cgi?host=${1} |See me on Nagios>\n-------------\"}"
curl -X POST --data-urlencode "$TEXT" "${HOOK}"
