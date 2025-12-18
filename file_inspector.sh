#!/usr/bin/env bash

if (( $# != 1 )); then
    echo "Error, you need to pass a file as an argument"
    exit 1
fi

FILE="$1"

if [[ ! -f ${FILE} ]]; then
    echo "Error, the passed argument is not a file"
    exit 2
fi

echo "Inspecting file: ${FILE}"

if [[ -r ${FILE} ]]; then
    echo "Reading: YES"
else
    echo "Reading: NO"
fi

if [[ -w ${FILE} ]]; then
    echo "Writing: YES"
else
    echo "Writing: NO"
fi

if [[ -x ${FILE} ]]; then
    echo "Execution: YES"
else
    echo "Execution: NO"
fi
