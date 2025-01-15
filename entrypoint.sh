#!/bin/bash

echo "Welcome to the Bash Shell DBMS"
while true; do
  echo "\nMain Menu:"
  echo "1. Create Database"
  echo "2. List Databases"
  echo "3. Drop Database"
  echo "4. Connect to Database"
  echo "5. Exit"

  read -p "Choose an option: " choice

  case $choice in
    1) ./scripts/db/create-db.sh ;;
    2) ./scripts/db/list-db.sh ;;
    3) ./scripts/db/drop-db.sh ;;
    4) ./scripts/db/connect-db.sh ;;
    5) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done