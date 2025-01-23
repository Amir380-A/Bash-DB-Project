#!/bin/bash

dbname=$1

read -p "Enter table name to drop: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  rm "databases/$dbname/$tablename.data" "databases/$dbname/$tablename.meta"
  echo "Table $tablename dropped successfully."
else
  echo "Table $tablename does not exist."
fi
