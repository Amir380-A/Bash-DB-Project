#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  echo "Table $tablename already exists."
else
  read -p "Enter column names (comma-separated): " columns
  echo "$columns" > "databases/$dbname/$tablename.meta"
  touch "databases/$dbname/$tablename.data"
  echo "Table $tablename created successfully."
fi
