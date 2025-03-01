#!/bin/bash

# Dammed simple script to constantly check when either free memory is low or memory usage reaches
# your installed RAM amount. Then popup a warning box and/or kill an app to stop whole system freezing

# Threshold for low memory (adjust as needed)
#THRESHOLD=290000  # free mem threshold of 290K
THRESHOLD=6000000  # free mem threshold of 290K

while true; do
  # Get current memory usage (in KB)
  #MEM=$(free -k | awk 'NR==2 {print $4}')
  MEM=$(free -k | awk 'NR==2 {print $3}')

  #echo "Memory free: $MEM KB" #>> /tmp/low_memory_log.txt
  # Check if memory usage is above the threshold
  if [[ "$MEM" -gt "$THRESHOLD" ]]; then
    # Display a warning (using zenity for a GUI popup)
    zenity --warning --text "Low Memory Warning! Memory free is below ${THRESHOLD}."

    # Kill Chrome (replace with your specific Chrome process name if needed)
    ## pkill chrome

    # Optionally, you might want to log this event
    date >> /tmp/low_memory_log.txt
    echo "WARNING: Mem free: $MEM KB" >> /tmp/low_memory_log.txt
    echo "WARNING: Mem free: $MEM KB" #>> /tmp/low_memory_log.txt
  fi

  # Wait for 10 seconds
  sleep 10
done