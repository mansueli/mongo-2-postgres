#!/bin/bash
# Directory containing CSV files
csv_directory="./"
# Loop through each CSV file in the directory
for csv_file in "$csv_directory"/*.csv; do
    if [ -f "$csv_file" ]; then
        # Replace single quotes with double quotes for JSON objects
        sed -i 's/\'/"/g' "$csv_file"

        # Replace datetime.datetime objects with ISO strings
        sed -i -E 's/datetime\.datetime\(([0-9]+), ([0-9]+), ([0-9]+), ([0-9]+), ([0-9]+)\)/"\1-\2-\3T\4:\5:00Z"/g' "$csv_file"

        # Replace Decimal128 objects with formats that PostgreSQL accepts
        sed -i -E 's/Decimal128\(([0-9]+\.[0-9]+)\)/\1/g' "$csv_file"

        echo "Converted $csv_file"
    fi
done
