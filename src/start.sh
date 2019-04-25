#!/bin/sh
DATE=$(date '+%Y_%m_%d__%H_%M')

if [ $PID ] && [ $FILE ]; then
  mkdir -p /strace/output
  strace -f -p $PID -o /strace/output/$FILE
elif [ $PID ]; then
	strace -f -p $PID
else
  echo "NO PID SPECIFIED"
fi
