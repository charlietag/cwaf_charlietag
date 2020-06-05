#!/bin/bash

# ------------------------------------
# Source script lib
# ------------------------------------
. "$(dirname $(readlink -m $0))/../lib/cwaf-script-lib.sh"

# ------------------------------------
# Define and check app version
# ------------------------------------
# App version
# PARAM_COMODO_RULES_VER : defined in cfg file

# Check app version
check_app "comodo-rules-version" "${PARAM_COMODO_RULES_VER}"
check_app_run  # Comment this line, to avoid check app version , always execute this script

# ------------------------------------

start_script
# ***********************************************************************************************************
# ------------------------------------
# Start
# ------------------------------------
echo " ------------------------------------"
echo " Download COMODO Rules - CWAF...."
echo " ------------------------------------"
wget \
--no-check-certificate \
--header='Accept-Language:en-us,en;q=0.5' \
--header='Accept:text/html;q=0.9,*/*;q=0.8' \
--header='Accept-Charset:ISO-8859-1,utf-8;q=0.7,*;q=0.7' \
--header='User-Agent:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36' \
--post-data "login=${PARAM_COMODO_RULES_account}&password=${PARAM_COMODO_RULES_password}&act=download&source=4&version=${PARAM_COMODO_RULES_VER}" \
--content-disposition \
${PARAM_COMODO_API_URL}

IF_RULES_DOWNLOADED="$(ls ${THIS_PATH_TMP} | grep "cwaf_rules_nginx_3-${PARAM_COMODO_RULES_VER}.tgz")"
if [[ -n "${IF_RULES_DOWNLOADED}" ]]; then
  echo 
  echo ">>>>>>>>>>>>>>>"
  echo "Copy ${IF_RULES_DOWNLOADED} ---> ${THIS_PATH_OUTPUT}/ ....!"
  \cp -f ${THIS_PATH_TMP}/${IF_RULES_DOWNLOADED} ${THIS_PATH_OUTPUT}/

fi

echo "Done ...!"
echo 

# ***********************************************************************************************************

# ------------------------------------
# Stop
# ------------------------------------
stop_script
