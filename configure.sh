#!/bin/bash

# colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"


echo -e "1. Beginning the configuration of environment variables"

echo -e " -${YELLOW} generate secrets"

db_user="uph_server"
db_name="uph_server"
db_password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16 ; echo '')

echo -e " - creating a file"

echo -e "DATABASE_USER=$db_user\\nDATABASE_NAME=$db_name\\nDATABASE_PASSWORD=$db_password" > database.env

echo -e "${GREEN} - DONE - ${ENDCOLOR}"

echo -e "2. Prepare plugins for installation"

echo -e " -${YELLOW} checking the number of plugins"

plugins_to_instal=$(ls ./target/ | grep -i '.jar' | wc -l)

if [ $plugins_to_instal -eq 0 ]
then
    echo -e " - nothing to copy"
else
    echo -e " - copying $plugins_to_instal files"

    cp ./target/* ./server/plugins/
fi

echo -e "${GREEN} - DONE - ${ENDCOLOR}"