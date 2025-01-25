#!/bin/bash

dbname=$1

read -p "Enter table name: " tablename

# Check if the table data file exists
if [ -f "databases/$dbname/$tablename.data" ]; then
  # Read column name and value to match
  read -p "Enter column name to match: " column  # For example, 'id'
  read -p "Enter value to match: " match_value   # For example, '1'

  # Get the column index from the meta file
  column_index=$(head -1 "databases/$dbname/$tablename.meta" | tr ',' '\n' | grep -n "^$column$" | cut -d: -f1)

  # Validate column index
  if [ -z "$column_index" ]; then
    echo "Invalid column name."
    exit 1
  fi

  # Use awk to delete matching records
  awk -v col="$column_index" -v match_val="$match_value" -F, '
  BEGIN { OFS = FS }
  $col != match_val         # Keep rows that do not match
  ' "databases/$dbname/$tablename.data" > tmp

  # Check if any records were removed
  if cmp -s "tmp" "databases/$dbname/$tablename.data"; then
    echo "No records matchjjed the criteria. No changes were made."
    rm tmp
  else
    mv tmp "databases/$dbname/$tablename.data"
    echo "Records deleted successfully."
  fi

else
  echo "Table $tablename does not exist."
fi
