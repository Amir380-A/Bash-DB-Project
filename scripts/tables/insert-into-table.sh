#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  echo "Table Columns:"
  cat "databases/$dbname/$tablename.meta"
  read -p "Enter values (comma-separated): " values
  echo "$values" >> "databases/$dbname/$tablename.data"
  echo "Record inserted successfully."
else
  echo "Table $tablename does not exist."
fi
