#!/bin/bash

# Check if lm_sensors is installed
if ! command -v sensors &> /dev/null
then
  echo "Error: lm_sensors is required to run this script but it is not installed."
  read -p "Press enter to exit..."
  exit 1
fi

# Output file name
output_file="log.csv"

# Sampling interval in seconds
interval=1

# Logged value name provided as an argument
value_name=$1

# Check if the value name is provided
if [ -z "$value_name" ]
then
  echo "Error: Value name is required."
  read -p "Press enter to exit..."
  exit 1
fi

# Loop to log the temperature
while true; do
    # Get the CPU temperature
    temp=$(sensors | grep $value_name | awk '{print $2}' | sed 's/+//' | sed 's/°C//')
    
    # Get the current date
    date=$(date +"%Y-%m-%d")

    # Get the current time
    time=$(date +"%H:%M:%S")
    
    # Log the temperature to the console
    echo "[$date $time] $value_name: $temp °C"
    
    # Append the temperature to the output file
    echo "$date,$time,$temp" >> $output_file
    
    # Wait for the specified interval
    sleep $interval
done
