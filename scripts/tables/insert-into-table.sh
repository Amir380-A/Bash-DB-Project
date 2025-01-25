#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  echo "Table Columns: id,name,age,num (id is auto-generated)"

  # Prompt user for values for name, age, and num
  read -p "Enter name: " name
  read -p "Enter age: " age
  read -p "Enter num: " num

  # Auto-increment the ID based on the last entry
  last_id=$(tail -n 1 "databases/$dbname/$tablename.data" | cut -d',' -f1)
  if [ -z "$last_id" ]; then
    id=1
  else
    id=$((last_id + 1))
  fi

  # Insert the new record
  echo "$id,$name,$age,$num" >> "databases/$dbname/$tablename.data"
  echo "Record inserted successfully."
else
  echo "Table $tablename does not exist."
fi
