#!/bin/bash

read -p "Enter database name to drop: " dbname
if [ -d "databases/$dbname" ]; then
  rm -rf "databases/$dbname"
  echo "Database $dbname dropped successfully."
else
  echo "Database $dbname does not exist."
fi