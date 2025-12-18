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

# LOGICS

clear

if [[ -r ${FILE} ]]; then
    R_ICON="[x]"
    R_TEXT="YES"
else
    R_ICON="[ ]"
    R_TEXT="NO"
fi

if [[ -w ${FILE} ]]; then
    W_ICON="[x]"
    W_TEXT="YES"
else
    W_ICON="[ ]"
    W_TEXT="NO"
fi

if [[ -x ${FILE} ]]; then
    X_ICON="[x]"
    X_TEXT="YES"
else
    X_ICON="[ ]"
    X_TEXT="NO"
fi

# UI

echo "========================================"
echo "       FILE INSPECTOR v0.2.0           "
echo "========================================"
echo ""

echo "TARGET INFO"
echo "-----------"
printf "File Name : %s\n" "${FILE}"
echo ""

echo "PERMISSIONS"
echo "-----------"

printf "%-12s %-5s %s\n" "Type" "Check" "Status"
echo "------------ ----- ------"

printf "%-12s %-5s %s\n" "Read"    "${R_ICON}" "${R_TEXT}"
printf "%-12s %-5s %s\n" "Write"   "${W_ICON}" "${W_TEXT}"
printf "%-12s %-5s %s\n" "Execute" "${X_ICON}" "${X_TEXT}"

echo ""
echo "========================================"
echo "Analysis Complete."
echo ""
