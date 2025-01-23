#!/bin/bash

read -p "Enter database name to connect: " dbname
if [ -d "databases/$dbname" ]; then
  echo "Connected to database $dbname."
  ./scripts/tables/tables-menu.sh $dbname
else
  echo "Database $dbname does not exist."
fi