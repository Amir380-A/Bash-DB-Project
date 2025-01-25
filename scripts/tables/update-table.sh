#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

if [ -f "databases/$dbname/$tablename.data" ]; then
  read -p "Enter column name to match: " column   # For example, 'id'
  read -p "Enter value to match: " match_value    # For example, '1'
  read -p "Enter column name to update: " update_column  # Column to update (e.g., 'name')
  read -p "Enter new value: " new_value   # New value for the update column

  # Get the column indexes for match and update columns
  column_index=$(head -1 "databases/$dbname/$tablename.meta" | tr ',' '\n' | grep -n "^$column$" | cut -d: -f1)
  update_index=$(head -1 "databases/$dbname/$tablename.meta" | tr ',' '\n' | grep -n "^$update_column$" | cut -d: -f1)

  # Validate column indexes
  if [ -z "$column_index" ] || [ -z "$update_index" ]; then
    echo "Invalid column names."
    exit 1
  fi

  # Use awk to update the matching records
  awk -v col="$column_index" -v match_value="$match_value" -v ucol="$update_index" -v newval="$new_value" -F, '
  BEGIN { OFS = FS }
  $col == match_value { $ucol = newval }  # Update the matching row
  { print }
  ' "databases/$dbname/$tablename.data" > tmp && mv tmp "databases/$dbname/$tablename.data"

  echo "Record updated successfully."
else
  echo "Table $tablename does not exist."
fi
