#!/bin/bash

START_TIME=$(date +%s) #script start time
echo "script executed at $START_TIME"

sleep 10 # simulate some processing time

END_TIME=$(date +%s) #script end time
echo "script executed at $END_TIME"

echo "script executed at $START_TIME and ended at $END_TIME"

EXECUTION_TIME=$(( END_TIME - START_TIME ))
echo "script execution time is $EXECUTION_TIME seconds"
