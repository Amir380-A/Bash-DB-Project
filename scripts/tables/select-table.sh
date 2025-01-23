#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  echo "Table Structure:"
  cat "databases/$dbname/$tablename.meta"
  echo "Table Data:"
  cat "databases/$dbname/$tablename.data"
else
  echo "Table $tablename does not exist."
fi
