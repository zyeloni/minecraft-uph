#!/bin/bash

echo "Start configutation docker"

echo " - generate secrets"

db_user="uph_server"
db_name="uph_server"
db_password=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 16 ; echo '')

echo " - prepare to save file"

echo -e "DATABASE_USER=$db_user\\nDATABASE_NAME=$db_name\\nDATABASE_PASSWORD=$db_password" > config/.env;

echo " - DONE -"