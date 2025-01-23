#!/bin/bash

dbname=$1

if [ -d "databases/$dbname" ]; then
  echo "Tables in database $dbname:"
  ls databases/$dbname | grep -v "\.meta$" | sed 's/.data//'
else
  echo "Database $dbname does not exist."
fi
