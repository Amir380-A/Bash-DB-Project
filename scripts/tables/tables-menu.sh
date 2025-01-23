#!/bin/bash

dbname=$1
while true; do
  echo "\nTables Menu for Database: $dbname"
  echo "1. List Tables"
  echo "2. Create Table"
  echo "3. Drop Table"
  echo "4. Select From Table"
  echo "5. Insert Into Table"
  echo "6. Update Table"
  echo "7. Delete From Table"
  echo "8. Back to Main Menu"

  read -p "Choose an option: " choice

  case $choice in
    1) ./scripts/tables/list-tables.sh $dbname ;;
    2) ./scripts/tables/create-table.sh $dbname ;;
    3) ./scripts/tables/drop-table.sh $dbname ;;
    4) ./scripts/tables/select-table.sh $dbname ;;
    5) ./scripts/tables/insert-into-table.sh $dbname ;;
    6) ./scripts/tables/update-table.sh $dbname ;;
    7) ./scripts/tables/delete-from-table.sh $dbname ;;
    8) break ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done