#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  read -p "Enter column name to match: " column
  read -p "Enter value to match: " match_value
  read -p "Enter column name to update: " update_column
  read -p "Enter new value: " new_value

  column_index=$(head -1 "databases/$dbname/$tablename.meta" | tr ',' '\n' | grep -n "^$column$" | cut -d: -f1)
  update_index=$(head -1 "databases/$dbname/$tablename.meta" | tr ',' '\n' | grep -n "^$update_column$" | cut -d: -f1)

  if [ -z "$column_index" ] || [ -z "$update_index" ]; then
    echo "Invalid column names."
    exit 1
  fi

  awk -v col="$column_index" -v match="$match_value" -v ucol="$update_index" -v newval="$new_value" -F, '
  BEGIN { OFS = FS }
  NR == 1 { print; next }
  $col == match { $ucol = newval }
  { print }
  ' "databases/$dbname/$tablename.data" > tmp && mv tmp "databases/$dbname/$tablename.data"

  echo "Record updated successfully."
else
  echo "Table $tablename does not exist."
fi
