#!/bin/bash
set -eu

# SIMULATION SH

if (( ${#} != 5 ))
then
  echo "simulation.sh: Provide START ITERATION SLICE INPUT OUTPUT"
  exit 1
fi

START=$1
ITERATION=$2
SLICE=$3
INPUT=$4
OUTPUT=$5

TIME=$(( $( date +%s ) - START ))
VALUE=$RANDOM
printf "simulation.sh: TIME %3i   ITERATION %2i   SLICE %2i   INPUT %5i   VALUE %5i  @ %s\n" \
       $TIME $ITERATION $SLICE $INPUT $VALUE $( hostname )

sleep 3

# Write an output value:
echo $VALUE > $OUTPUT
